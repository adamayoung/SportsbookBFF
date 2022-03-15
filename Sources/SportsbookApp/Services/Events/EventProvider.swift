import Foundation

protocol EventProvider {

    func find(withID id: EventDomainModel.ID, locale: Locale) async throws -> EventDomainModel?

    func find(forMarket marketID: MarketDomainModel.ID, locale: Locale) async throws -> EventDomainModel?

    func all(forCompetition competitionID: CompetitionDomainModel.ID, locale: Locale) async throws -> [EventDomainModel]

    func all(forSport sportID: SportDomainModel.ID, isInPlay: Bool?, locale: Locale) async throws -> [EventDomainModel]

    func all(forSports sportIDs: [SportDomainModel.ID], isInPlay: Bool?,
             locale: Locale) async throws -> [SportDomainModel.ID: [EventDomainModel]]

}

extension EventProvider {

    func all(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [EventDomainModel] {
        try await all(forSport: sportID, isInPlay: nil, locale: locale)
    }

    func all(forSports sportIDs: [SportDomainModel.ID],
             locale: Locale) async throws -> [SportDomainModel.ID: [EventDomainModel]] {
        try await all(forSports: sportIDs, isInPlay: nil, locale: locale)
    }

}
