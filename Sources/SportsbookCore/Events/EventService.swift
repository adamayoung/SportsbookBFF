import Foundation

public protocol EventService {

    func event(withID id: EventDomainModel.ID, locale: Locale) async throws -> EventDomainModel?

    func events(forCompetition competitionID: CompetitionDomainModel.ID,
                locale: Locale) async throws -> [EventDomainModel]

    func events(forSport sportID: SportDomainModel.ID, isInPlay: Bool?,
                locale: Locale) async throws -> [EventDomainModel]

    func event(forMarket marketID: MarketDomainModel.ID, locale: Locale) async throws -> EventDomainModel?

}

extension EventService {

    public func events(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [EventDomainModel] {
        try await events(forSport: sportID, isInPlay: nil, locale: locale)
    }

}
