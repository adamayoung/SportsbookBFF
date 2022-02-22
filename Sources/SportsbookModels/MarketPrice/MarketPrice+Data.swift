import SportsbookCore
import Vapor

public extension MarketPrice {

    static func find(forMarket marketID: Market.ID, on request: Request) async throws -> MarketPrice? {
        try await request.marketPriceService.marketPrice(forMarket: marketID)
            .map(MarketPrice.init)
    }

}

public extension MarketPrice {

    func market(on request: Request) async throws -> Market? {
        try await Market.find(marketID, on: request)
    }

}
