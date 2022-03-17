import Foundation

public protocol MarketPriceProvider {

    func find(forMarket marketID: Market.ID) async throws -> MarketPrice?

}
