import Sportsbook
import Vapor

extension EventType {

    static func all(query: EventTypesQuery? = nil, on request: Request) -> EventLoopFuture<[EventType]> {
        request.eventTypeService.fetchEventTypes(filter: query?.eventTypesFilter)
            .mapEach(EventType.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: id)
            .optionalMap(EventType.init)
    }

    static func find(forCompetition competitionID: Int, on request: Request) -> EventLoopFuture<EventType?> {
        request.competitionService.fetchCompetition(withID: competitionID)
            .map { $0?.eventTypeID }
            .optionalFlatMap { request.eventTypeService.fetchEventType(withID: $0) }
            .optionalMap(EventType.init)
    }

    static func find(forEvent eventID: Int, on request: Request) -> EventLoopFuture<EventType?> {
        request.eventService.fetchEvent(withID: eventID)
            .map { $0?.eventTypeID }
            .optionalFlatMap { request.eventTypeService.fetchEventType(withID: $0) }
            .optionalMap(EventType.init)
    }

}
