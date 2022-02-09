import Graphiti
import SportsbookModels
import Vapor

extension Market {

    func event(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Event?> {
        let promise = request.eventLoop.makePromise(of: Optional<Event>.self)
        promise.completeWithTask {
            try await event(on: request)
        }

        return promise.futureResult
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        let promise = request.eventLoop.makePromise(of: Optional<Competition>.self)
        promise.completeWithTask {
            try await competition(on: request)
        }

        return promise.futureResult
    }

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        let promise = request.eventLoop.makePromise(of: Optional<EventType>.self)
        promise.completeWithTask {
            try await eventType(on: request)
        }

        return promise.futureResult
    }

}
