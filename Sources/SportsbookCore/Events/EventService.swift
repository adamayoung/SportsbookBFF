import Foundation

public protocol EventService {

    func fetchEvent(withID id: EventDomainModel.ID) async throws -> EventDomainModel?

    func fetchEvents(forCompetition competitionID: CompetitionDomainModel.ID) async throws -> [EventDomainModel]

    func fetchEvents(forEventType eventTypeID: EventTypeDomainModel.ID,
                     isInPlay: Bool?) async throws -> [EventDomainModel]

}

public extension EventService {

    func fetchEvents(forEventType eventTypeID: EventTypeDomainModel.ID) async throws -> [EventDomainModel] {
        try await fetchEvents(forEventType: eventTypeID, isInPlay: nil)
    }

}
