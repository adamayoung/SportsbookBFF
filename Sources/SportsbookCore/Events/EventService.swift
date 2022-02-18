import Foundation

public protocol EventService {

    func event(withID id: EventDomainModel.ID) async throws -> EventDomainModel?

    func events(forCompetition competitionID: CompetitionDomainModel.ID) async throws -> [EventDomainModel]

    func events(forSport sportID: SportDomainModel.ID, isInPlay: Bool?) async throws -> [EventDomainModel]

}

extension EventService {

    public func events(forSport sportID: SportDomainModel.ID) async throws -> [EventDomainModel] {
        try await events(forSport: sportID, isInPlay: nil)
    }

}
