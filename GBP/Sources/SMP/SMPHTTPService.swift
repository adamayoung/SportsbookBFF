import GBPCore
import Vapor

struct SMPHTTPService: SMPService {

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
        logger.debug("Searching SMP service")

        let uri: URI = "\(baseURL)/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1"
        print(uri)
    }

}
