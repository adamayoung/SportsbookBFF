import Foundation
import SMP
import Vapor

final class MarketPriceSMPService: MarketPriceService {

    private let smpService: SMPService
    private let logger: Logger

    init(smpService: SMPService, logger: Logger) {
        self.smpService = smpService
        self.logger = logger
    }

    func marketPrice(forMarket marketID: MarketDomainModel.ID) async throws -> MarketPriceDomainModel? {
        logger.debug("Fetching Market Price", metadata: ["marketID": .stringConvertible(marketID)])

        guard let marketPrice = try await smpService.marketPrices(forMarket: marketID) else {
            return nil
        }

        return MarketPriceDomainModel(marketPrice: marketPrice)
    }

}
