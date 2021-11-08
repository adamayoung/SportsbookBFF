import Graphiti
import Sportsbook
import Vapor

extension Competition {

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: self.eventTypeID)
            .optionalMap(EventType.init)
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        guard let id = arguments.id else {
            return request.eventService.fetchEvents(forCompetition: self.id)
                .mapEach(Event.init)
        }

        return request.eventService.fetchEvent(withID: id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
            .mapEach(Event.init)
    }

}
