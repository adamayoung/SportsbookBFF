import Foundation
import Vapor

struct MarketPricesRequest: Equatable, Hashable, Content {

    let marketIds: [String]
    let priceHistory: Int?

    init(marketIds: [String], priceHistory: Int? = nil) {
        self.marketIds = marketIds
        self.priceHistory = priceHistory
    }

    init(marketId: String, priceHistory: Int? = nil) {
        self.init(marketIds: [marketId], priceHistory: priceHistory)
    }

}
