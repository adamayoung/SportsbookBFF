import Graphiti
import SportsbookCore
import Vapor

extension Resolver {

    func fetchEvents(request: Request, arguments: EventArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            guard let event = try await request.eventService.event(withID: arguments.id) else {
                return []
            }

            return [Event(event: event)]
        }

        return promise.futureResult
    }

}
