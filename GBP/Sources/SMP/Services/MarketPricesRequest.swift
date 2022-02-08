import Foundation
import Vapor

struct MarketPricesRequest: Equatable, Hashable, Content {

    public let marketIds: [String]
    public let priceHistory: Int?

    public init(marketIds: [String], priceHistory: Int? = nil) {
        self.marketIds = marketIds
        self.priceHistory = priceHistory
    }

    public init(marketId: String, priceHistory: Int? = nil) {
        self.init(marketIds: [marketId], priceHistory: priceHistory)
    }

}
