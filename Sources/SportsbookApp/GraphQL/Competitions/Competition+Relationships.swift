import Graphiti
import SportsbookModels
import Vapor

extension Competition {

    func eventType(request: Request, arguments: NoArguments) -> EventLoopFuture<EventType?> {
        let promise = request.eventLoop.makePromise(of: Optional<EventType>.self)
        promise.completeWithTask {
            try await eventType(on: request)
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

            return events.filter { $0.id == eventID }
        }

        return promise.futureResult
    }

}
