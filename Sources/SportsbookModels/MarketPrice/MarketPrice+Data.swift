import SportsbookCore
import Vapor

public extension MarketPrice {

    static func find(forMarket marketID: Market.ID, on request: Request) async throws -> MarketPrice? {
        guard let marketPrice = try await request.marketPriceService.marketPrice(forMarket: marketID) else {
            return nil
        }

        return MarketPrice(marketPrice: marketPrice)
    }

}

public extension MarketPrice {

    func market(on request: Request) async throws -> Market? {
        try await Market.find(marketID, on: request)
    }

}
