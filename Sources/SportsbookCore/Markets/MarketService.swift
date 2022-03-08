import Foundation

public protocol MarketService {

    func market(withID id: MarketDomainModel.ID, locale: Locale) async throws -> MarketDomainModel?

    func markets(forEvent eventID: Int, locale: Locale) async throws -> [MarketDomainModel]

}
