import Graphiti
import SportsbookCore
import Vapor

extension EventType {

    func competitions(request: Request,
                      arguments: CompetitionsArguments) throws -> EventLoopFuture<[Competition]> {
        let promise = request.eventLoop.makePromise(of: [Competition].self)
        promise.completeWithTask {
            guard let competitionID = arguments.id else {
                return try await request.competitionService.fetchCompetitions(forEventType: self.id)
                    .map(Competition.init)
            }

            guard let competition = try await request.competitionService.fetchCompetition(withID: competitionID) else {
                return []
            }

            return [Competition(competition: competition)]
        }

        return promise.futureResult
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            guard let eventID = arguments.id else {
                return try await request.eventService.fetchEvents(forEventType: self.id, isInPlay: arguments.isInPlay)
                    .map(Event.init)
            }

            guard let event = try await request.eventService.fetchEvent(withID: eventID) else {
                return []
            }

            guard event.eventTypeID == self.id else {
                return []
            }

            guard let isInPlayArgument = arguments.isInPlay, event.isInPlay == isInPlayArgument else {
                return []
            }

            return [Event(event: event)]
        }

        return promise.futureResult
    }

}
