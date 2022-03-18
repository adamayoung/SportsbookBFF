import Foundation
import Logging
import SMP
import Sportsbook

struct ISPMarketPriceService: MarketPriceService {

    private let smp: SMPService
    private let logger: Logger

    init(smp: SMPService, logger: Logger) {
        self.smp = smp
        self.logger = logger
    }

    func find(forMarket marketID: Market.ID) async throws -> MarketPrice? {
        logger.debug("Fetching Market Price", metadata: ["marketID": .stringConvertible(marketID)])

        guard let marketPrice = try await smp.marketPrices(forMarket: marketID) else {
            return nil
        }

        let model = MarketPrice(marketPrice: marketPrice)
        return model
    }

}
