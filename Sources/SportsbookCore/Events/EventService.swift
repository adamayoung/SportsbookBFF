import Foundation

public protocol EventService {

    func event(withID id: EventDomainModel.ID) async throws -> EventDomainModel?

    func events(forCompetition competitionID: CompetitionDomainModel.ID) async throws -> [EventDomainModel]

    func events(forEventType eventTypeID: EventTypeDomainModel.ID,
                isInPlay: Bool?) async throws -> [EventDomainModel]

}

extension EventService {

    public func events(forEventType eventTypeID: EventTypeDomainModel.ID) async throws -> [EventDomainModel] {
        try await events(forEventType: eventTypeID, isInPlay: nil)
    }

}
