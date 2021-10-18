import Graphiti
import Sportsbook
import Vapor

extension Competition {

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: self.eventTypeID)
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        guard let id = arguments.id else {
            return request.eventService.fetchEvents(forCompetition: self.id)
        }

        return request.eventService.fetchEvent(withID: id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
