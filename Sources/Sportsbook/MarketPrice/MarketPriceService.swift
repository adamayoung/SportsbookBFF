import Foundation

public protocol MarketPriceService {

    func find(forMarket marketID: Market.ID) async throws -> MarketPrice?

}
