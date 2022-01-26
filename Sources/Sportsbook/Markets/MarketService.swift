import Foundation

public protocol MarketService {

    func fetchMarket(withID id: MarketDomainModel.ID) async throws -> MarketDomainModel?

    func fetchMarkets(forEvent eventID: Int) async throws -> [MarketDomainModel]

}
