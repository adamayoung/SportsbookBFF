import Foundation

public protocol MarketService {

    func find(withID id: Market.ID, locale: Locale) async throws -> Market?

    func primary(forEvent eventID: Event.ID, locale: Locale) async throws -> Market?

    func all(forEvent eventID: Event.ID, locale: Locale) async throws -> [Market]

    func all(forEvents eventIDs: [Event.ID], locale: Locale) async throws -> [Event.ID: [Market]]

}
