import Vapor

extension MarketPrice {

    static func find(forMarket marketID: Market.ID, on request: Request) async throws -> MarketPrice? {
        try await request.marketPrices.find(forMarket: marketID)
    }

}

extension MarketPrice {

    func market(on request: Request) async throws -> Market? {
        try await Market.find(marketID, on: request)
    }

}
