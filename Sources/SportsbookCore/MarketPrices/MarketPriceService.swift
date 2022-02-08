import Foundation

public protocol MarketPriceService {

    func marketPrice(forMarket marketID: MarketDomainModel.ID) async throws -> MarketPriceDomainModel?

}
