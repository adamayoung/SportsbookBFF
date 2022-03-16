import Foundation
import Logging
import SMP

struct MarketPriceService: MarketPriceProvider {

    private let smp: SMPProvider
    private let logger: Logger

    init(smp: SMPProvider, logger: Logger) {
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
