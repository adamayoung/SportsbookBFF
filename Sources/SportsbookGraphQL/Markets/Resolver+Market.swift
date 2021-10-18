import Foundation
import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchMarkets(request: Request, arguments: MarketArguments) throws -> EventLoopFuture<[Market]> {
        request.marketService.fetchMarket(withID: arguments.id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
