import Graphiti
import SportsbookModels
import Vapor

extension Competition {

    func sport(request: Request, arguments: NoArguments) -> EventLoopFuture<Sport?> {
        let promise = request.eventLoop.makePromise(of: Optional<Sport>.self)
        promise.completeWithTask {
            try await sport(on: request)
        }

        return promise.futureResult
    }

    func events(request: Request, arguments: EventsArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            let events = try await events(on: request)
            guard let eventID = arguments.id else {
                return events
            }

            guard let event = (events.first { $0.id == eventID }) else {
                return []
            }

            return [event]
        }

        return promise.futureResult
    }

}
