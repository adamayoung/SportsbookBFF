import Graphiti
import SportsbookModels
import Vapor

extension Event {

    func markets(request: Request, arguments: MarketsArguments) -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            if let marketID = arguments.id {
                guard let market = try await Market.find(marketID, on: request) else {
                    return []
                }

                return [market]
            }

            if let marketType = arguments.marketType {
                return try await markets(marketType: marketType, on: request)
            }

            return try await markets(on: request)
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
