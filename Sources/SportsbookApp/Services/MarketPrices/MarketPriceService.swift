import Foundation
import SMP
import Vapor

struct MarketPriceService: MarketPriceProvider {

    private let smp: SMPProvider
    private let logger: Logger

    init(smp: SMPProvider, logger: Logger) {
        self.smp = smp
        self.logger = logger
    }

    func find(forMarket marketID: MarketDomainModel.ID) async throws -> MarketPriceDomainModel? {
        logger.debug("Fetching Market Price", metadata: ["marketID": .stringConvertible(marketID)])

        guard let marketPrice = try await smp.marketPrices(forMarket: marketID) else {
            return nil
        }

        let model = MarketPriceDomainModel(marketPrice: marketPrice)
        return model
    }

}

extension Request {

    var marketPrices: MarketPriceProvider {
        self.application.marketPricesFactory.make!(self)
    }

}
