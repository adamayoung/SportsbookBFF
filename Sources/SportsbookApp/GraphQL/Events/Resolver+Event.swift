import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchEvents(request: Request, arguments: EventArguments) throws -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            guard let event = try await Event.find(arguments.id, on: request) else {
                return []
            }

            return [event]
        }

        return promise.futureResult
    }

}
