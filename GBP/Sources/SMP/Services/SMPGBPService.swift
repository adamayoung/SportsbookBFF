import Foundation
import GBPCore
import Logging

struct SMPGBPService: SMPService {

    private static let marketPricesPath = "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1"

    private let configuration: SMPConfiguration
    private let client: GBPClient
    private let logger: Logger

    init(configuration: SMPConfiguration, client: GBPClient, logger: Logger) {
        self.configuration = configuration
        self.client = client
        self.logger = logger
    }

    func marketPrices(forMarkets marketIDs: [String], maxResults: Int?) async throws -> [MarketDetails] {
        logger.debug("Fetching market prices from SMP service",
                     metadata: ["marketIDs": .stringConvertible(marketIDs.joined(separator: ", "))])

        let body = MarketPricesRequest(marketIds: marketIDs, priceHistory: maxResults)
        return try await client.post(Self.marketPricesPath, body: body, configuration: configuration)
    }

}
