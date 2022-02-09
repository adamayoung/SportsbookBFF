import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchMarkets(request: Request, arguments: MarketArguments) throws -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            guard let market = try await Market.find(arguments.id, on: request) else {
                return []
            }

            return [market]
        }

        return promise.futureResult
    }

}
