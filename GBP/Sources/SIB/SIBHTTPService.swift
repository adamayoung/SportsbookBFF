import GBPCore
import GBPCore
import Vapor

struct SIBHTTPService: SIBService {

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

    func implyBets(request: ImplyBetsRequestRepresentable) async throws -> ImpyBetsResponse {
        logger.debug("Imply Bets from SIB service")

        let uri: URI = "\(baseURL)/api/sports/fixedodds/transactional/v1/implyBets"

        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .contentType, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")
        headers.add(name: .ispTLAHeader, value: tlaAPIKey)

        let response = try await client.post(uri, headers: headers) { clientRequest in
            try clientRequest.content.encode(request.implyBetsRequest)
        }

        guard response.status == .ok else {
            throw Abort(response.status)
        }

        return try response.content.decode(ImpyBetsResponse.self, using: JSONDecoder.tla)

//        .always { result in
//            switch result {
//            case .failure(let error):
//                self.logger.error("Imply Bets from SIB service failed")
//                self.logger.report(error: error)
//
//            default:
//                break
//            }
//        }
    }

}
