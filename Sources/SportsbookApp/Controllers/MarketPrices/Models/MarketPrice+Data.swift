import SportsbookCore
import Vapor

extension MarketPrice {

    static func find(forMarket marketID: String, on request: Request) async throws -> MarketPrice? {
        guard let marketPrice = try await request.marketPriceService.marketPrice(forMarket: marketID) else {
            return nil
        }

        return MarketPrice(marketPrice: marketPrice)
    }

}
