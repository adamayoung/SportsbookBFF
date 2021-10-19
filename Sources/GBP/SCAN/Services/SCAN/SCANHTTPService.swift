import Vapor

struct SCANHTTPService: SCANService {

    private let configuration: SCANConfiguration
    private let client: Client
    private let cache: SCANCache?
    private let eventLoop: EventLoop
    private let logger: Logger

    init(configuration: SCANConfiguration, client: Client, cache: SCANCache? = nil, eventLoop: EventLoop,
         logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.cache = cache
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func search(searchRequest: SearchRequest) -> EventLoopFuture<SearchResponse> {
        logger.debug("Searching SCAN service", metadata: ["facets": .stringConvertible(searchRequest.facets)])

        guard let cache = cache else {
            return performSearch(searchRequest)
        }

        return cache.get(responseForRequest: searchRequest)
            .flatMap { cachedResponse in
                if let cachedResponse = cachedResponse {
                    return self.eventLoop.makeSucceededFuture(cachedResponse)
                }

                return self.performSearch(searchRequest)
                    .map {
                        self.cache?.set(request: searchRequest, to: $0).whenComplete { _ in }
                        return $0
                    }
            }
    }

}

extension SCANHTTPService {

    private func performSearch(_ searchRequest: SearchRequest) -> EventLoopFuture<SearchResponse> {
        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .contentType, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")

        do {
            try configuration.additionalHeaders().forEach {
                headers.add(name: $0.name, value: $0.value)
            }
        } catch let error {
            return eventLoop.makeFailedFuture(error)
        }

        return client.post(configuration.uri, headers: headers) { request in
            try request.content.encode(searchRequest)
        }
        .flatMapThrowing { response in
            guard response.status == .ok else {
                throw Abort(response.status)
            }

            return try response.content.decode(SearchResponse.self, using: JSONDecoder.tla)
        }
        .always { result in
            switch result {
            case .failure(let error):
                self.logger.error("Searching SCAN service failed",
                                  metadata: ["facets": .stringConvertible(searchRequest.facets)])
                self.logger.report(error: error)

            default:
                break
            }
        }
    }

}
