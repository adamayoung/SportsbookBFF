import Foundation

public protocol MarketProvider {

    func find(withID id: Market.ID, locale: Locale) async throws -> Market?

    func all(forEvent eventID: Event.ID, withMarketType marketType: String?, locale: Locale) async throws -> [Market]

    func all(forEvents eventIDs: [Event.ID], locale: Locale) async throws -> [Event.ID: [Market]]

}

extension MarketProvider {

    public func all(forEvent eventID: Event.ID, withMarketType marketType: String? = nil,
                    locale: Locale) async throws -> [Market] {
        try await self.all(forEvent: eventID, withMarketType: marketType, locale: locale)
    }

}
