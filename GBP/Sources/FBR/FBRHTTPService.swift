import GBPCore
import Vapor

struct FBRHTTPService: FBRService {

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

    func search() async throws {
        logger.debug("Searching FBR service")

        let uri: URI = "\(baseURL)/api/FixedOddsBetReporting/v1.0/searchBets"
        print(uri)
    }

}
