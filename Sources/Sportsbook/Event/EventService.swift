import Foundation

public protocol EventService {

    func find(withID id: Event.ID, locale: Locale) async throws -> Event?

    func find(forMarket marketID: Market.ID, locale: Locale) async throws -> Event?

    func all(forCompetition competitionID: Competition.ID, locale: Locale) async throws -> [Event]

    func all(forSport sportID: Sport.ID, isInPlay: Bool?, locale: Locale) async throws -> [Event]

    func all(forSports sportIDs: [Sport.ID], isInPlay: Bool?, locale: Locale) async throws -> [Sport.ID: [Event]]

}

extension EventService {

    public func all(forSport sportID: Sport.ID, locale: Locale) async throws -> [Event] {
        try await all(forSport: sportID, isInPlay: nil, locale: locale)
    }

    public func all(forSports sportIDs: [Sport.ID], locale: Locale) async throws -> [Sport.ID: [Event]] {
        try await all(forSports: sportIDs, isInPlay: nil, locale: locale)
    }

}
