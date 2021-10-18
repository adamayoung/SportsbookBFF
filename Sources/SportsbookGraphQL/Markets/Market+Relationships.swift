import Graphiti
import Sportsbook
import Vapor

extension Market {

    func event(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Event?> {
        request.eventService.fetchEvent(withID: self.eventID)
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        request.competitionService.fetchCompetition(withID: self.competitionID)
    }

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: self.eventTypeID)
    }

}
