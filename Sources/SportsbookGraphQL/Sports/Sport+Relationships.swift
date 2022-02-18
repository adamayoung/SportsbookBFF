import Graphiti
import SportsbookModels
import Vapor

extension Sport {

    func competitions(request: Request, arguments: CompetitionsArguments) throws -> EventLoopFuture<[Competition]> {
        let promise = request.eventLoop.makePromise(of: [Competition].self)
        promise.completeWithTask {
            let competitions = try await competitions(on: request)
            guard let competitionID = arguments.id else {
                return competitions
            }

            guard let competition = competitions.first(where: { $0.id == competitionID }) else {
                return []
            }

            return [competition]
        }

        return promise.futureResult
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            let events = try await events(isInPlay: arguments.isInPlay, on: request)
            guard let eventID = arguments.id else {
                return events
            }

            guard let event = events.first(where: { $0.id == eventID }) else {
                return []
            }

            guard let isInPlayArgument = arguments.isInPlay, event.isInPlay == isInPlayArgument else {
                return []
            }

            return [event]
        }

        return promise.futureResult
    }

}
