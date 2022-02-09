import Graphiti
import SportsbookModels
import Vapor

extension Event {

    func markets(request: Request, arguments: MarketsArguments) -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            let markets = try await markets(on: request)
            guard let marketID = arguments.id else {
                return markets
            }

            return markets.filter { $0.id == marketID }
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

    func eventType(request: Request, arguments: NoArguments) -> EventLoopFuture<EventType?> {
        let promise = request.eventLoop.makePromise(of: Optional<EventType>.self)
        promise.completeWithTask {
            try await eventType(on: request)
        }

        return promise.futureResult
    }

}
