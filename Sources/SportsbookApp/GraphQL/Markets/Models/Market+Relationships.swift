import Graphiti
import SportsbookCore
import Vapor

extension Market {

    func event(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Event?> {
        let promise = request.eventLoop.makePromise(of: Optional<Event>.self)
        promise.completeWithTask {
            try await request.eventService.event(withID: self.eventID)
                .map(Event.init)
        }

        return promise.futureResult
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        let promise = request.eventLoop.makePromise(of: Optional<Competition>.self)
        promise.completeWithTask {
            guard
                let competition = try await request.competitionService.competition(withID: self.competitionID)
            else {
                return nil
            }

            return Competition(competition: competition)
        }

        return promise.futureResult
    }

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        let promise = request.eventLoop.makePromise(of: Optional<EventType>.self)
        promise.completeWithTask {
            try await request.eventTypeService.eventType(withID: self.eventTypeID)
                .map(EventType.init)
        }

        return promise.futureResult
    }

}
