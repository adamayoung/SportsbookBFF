import Foundation

public protocol MarketProvider {

    func find(withID id: MarketDomainModel.ID, locale: Locale) async throws -> MarketDomainModel?

    func all(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> [MarketDomainModel]

    func all(forEvents eventIDs: [EventDomainModel.ID],
             locale: Locale) async throws -> [EventDomainModel.ID: [MarketDomainModel]]

}
