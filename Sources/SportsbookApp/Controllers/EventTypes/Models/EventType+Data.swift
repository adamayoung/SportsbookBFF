import SportsbookCore
import Vapor

extension EventType {

    static func all(query: EventTypesQuery? = nil, on request: Request) async throws -> [EventType] {
        try await request.eventTypeService.eventTypes(filter: query?.eventTypesFilter)
            .map(EventType.init)
    }

    static func find(_ id: Int, on request: Request) async throws -> EventType? {
        guard let eventType = try await request.eventTypeService.eventType(withID: id) else {
            return nil
        }

        return EventType(eventType: eventType)
    }

    static func find(forCompetition competitionID: Int, on request: Request) async throws -> EventType? {
        guard
            let competition = try await request.competitionService.competition(withID: competitionID),
            let eventType = try await request.eventTypeService.eventType(withID: competition.eventTypeID)
        else {
            return nil
        }

        return EventType(eventType: eventType)
    }

    static func find(forEvent eventID: Int, on request: Request) async throws -> EventType? {
        guard
            let event = try await request.eventService.event(withID: eventID),
            let eventType = try await request.eventTypeService.eventType(withID: event.eventTypeID)
        else {
            return nil
        }

        return EventType(eventType: eventType)
    }

}
