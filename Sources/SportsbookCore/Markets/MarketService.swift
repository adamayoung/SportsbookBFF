import Foundation

public protocol MarketService {

    func market(withID id: MarketDomainModel.ID) async throws -> MarketDomainModel?

    func markets(forEvent eventID: Int) async throws -> [MarketDomainModel]

}
