import Sportsbook
import Vapor

extension EventTypeModel {

    static func all(on request: Request) -> EventLoopFuture<[EventTypeModel]> {
        request.eventTypeService.fetchEventTypes()
            .mapEach(EventTypeModel.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<EventTypeModel?> {
        request.eventTypeService.fetchEventType(withID: id)
            .optionalMap(EventTypeModel.init)
    }

    static func find(forCompetition competitionID: Int, on request: Request) -> EventLoopFuture<EventTypeModel?> {
        request.competitionService.fetchCompetition(withID: competitionID)
            .map { $0?.eventTypeID }
            .optionalFlatMap { request.eventTypeService.fetchEventType(withID: $0) }
            .optionalMap(EventTypeModel.init)
    }

    static func find(forEvent eventID: Int, on request: Request) -> EventLoopFuture<EventTypeModel?> {
        request.eventService.fetchEvent(withID: eventID)
            .map { $0?.eventTypeID }
            .optionalFlatMap { request.eventTypeService.fetchEventType(withID: $0) }
            .optionalMap(EventTypeModel.init)
    }

}
