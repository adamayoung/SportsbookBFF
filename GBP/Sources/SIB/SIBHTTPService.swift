import GBPCore
import Vapor

struct SIBHTTPService: SIBService {

    private let configuration: TLAConfiguration
    private let client: Client
    private let logger: Logger

    init(configuration: TLAConfiguration, client: Client, logger: Logger) {
        self.configuration = configuration
        self.client = client.logging(to: logger)
        self.logger = logger
    }

    func implyBets(request: ImplyBetsRequestRepresentable) async throws -> ImpyBetsResponse {
        logger.debug("Imply Bets from SIB service")

        var headers = HTTPHeaders()
        headers.add(name: .accept, value: "application/json")
        headers.add(name: .contentType, value: "application/json")
        headers.add(name: .userAgent, value: "SportsbookBFF/1.0")

        try configuration.headers().forEach {
            headers.add(name: $0.name, value: $0.value)
        }

        let response = try await client.post(configuration.uri, headers: headers) { clientRequest in
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
