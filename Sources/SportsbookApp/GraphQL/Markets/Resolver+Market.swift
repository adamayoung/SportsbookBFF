import Graphiti
import SportsbookCore
import Vapor

extension Resolver {

    func fetchMarkets(request: Request, arguments: MarketArguments) throws -> EventLoopFuture<[Market]> {
        let promise = request.eventLoop.makePromise(of: [Market].self)
        promise.completeWithTask {
            guard let market = try await request.marketService.fetchMarket(withID: arguments.id) else {
                return []
            }

            return [Market(market: market)]
        }

        return promise.futureResult
    }

}
