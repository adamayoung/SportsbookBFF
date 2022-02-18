import Graphiti
import SportsbookModels
import Vapor

extension Event {

    func markets(request: Request, arguments: MarketsArguments) -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            if let marketType = arguments.marketType {
                return try await markets(marketType: marketType, on: request)
            }

            let markets = try await markets(on: request)
            guard let marketID = arguments.id else {
                return markets
            }

            guard let market = (markets.first { $0.id == marketID }) else {
                return []
            }

            return [market]
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

    func sport(request: Request, arguments: NoArguments) -> EventLoopFuture<Sport?> {
        let promise = request.eventLoop.makePromise(of: Optional<Sport>.self)
        promise.completeWithTask {
            try await sport(on: request)
        }

        return promise.futureResult
    }

}
