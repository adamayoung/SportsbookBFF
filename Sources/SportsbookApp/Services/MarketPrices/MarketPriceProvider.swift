import Foundation

public protocol MarketPriceProvider {

    func find(forMarket marketID: MarketDomainModel.ID) async throws -> MarketPriceDomainModel?

}
