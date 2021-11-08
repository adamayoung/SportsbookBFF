import Graphiti
import Sportsbook
import Vapor

extension Market {

    func event(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Event?> {
        request.eventService.fetchEvent(withID: self.eventID)
            .optionalMap(Event.init)
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        request.competitionService.fetchCompetition(withID: self.competitionID)
            .optionalMap(Competition.init)
    }

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: self.eventTypeID)
            .optionalMap(EventType.init)
    }

}
