import GBPCore
import Vapor

struct SCANHTTPService: SCANService {

    private let baseURL: String
    private let tlaAPIKey: String
    private let client: Client
    private let logger: Logger

    init(baseURL: String, tlaAPIKey: String, client: Client, logger: Logger) {
        self.baseURL = baseURL
        self.tlaAPIKey = tlaAPIKey
        self.client = client.logging(to: logger)
        self.logger = logger
    }

    func search(request: SearchRequest) async throws -> SearchResponse {
        logger.debug("Searching SCAN service", metadata: ["facets": .stringConvertible(request.facets)])

        let uri: URI = "\(baseURL)/www/sports/navigation/facet/v1.0/search"

        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .contentType, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")
        headers.add(name: .ispTLAHeader, value: tlaAPIKey)

        let response = try await client.post(uri, headers: headers) { clientRequest in
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
