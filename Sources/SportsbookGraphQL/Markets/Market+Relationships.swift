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

    func sport(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Sport?> {
        let promise = request.eventLoop.makePromise(of: Optional<Sport>.self)
        promise.completeWithTask {
            try await sport(on: request)
        }

        return promise.futureResult
    }

    func price(request: Request, arguments: NoArguments) throws -> EventLoopFuture<MarketPrice?> {
        let promise = request.eventLoop.makePromise(of: Optional<MarketPrice>.self)
        promise.completeWithTask {
            try await price(on: request)
        }

        return promise.futureResult
    }

}
