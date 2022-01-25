import Vapor

struct SCANHTTPService: SCANService {

    private let configuration: SCANConfiguration
    private let client: Client
    private let logger: Logger

    init(configuration: SCANConfiguration, client: Client, logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.logger = logger
    }

    func search(request: SearchRequest) async throws -> SearchResponse {
        logger.debug("Searching SCAN service", metadata: ["facets": .stringConvertible(request.facets)])

        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .contentType, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")

        try configuration.headers().forEach {
            headers.add(name: $0.name, value: $0.value)
        }
        logger.info("URL: \(configuration.uri)")

        let response = try await client.post(configuration.uri, headers: headers) { clientRequest in
            try clientRequest.content.encode(request)
        }

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(SearchResponse.self, using: JSONDecoder.tla)


//
//        .always { result in
//            switch result {
//            case .failure(let error):
//                self.logger.error("Searching SCAN service failed",
//                                  metadata: ["facets": .stringConvertible(request.facets)])
//                self.logger.report(error: error)
//
//            default:
//                break
//            }
//        }
    }

}
