import Sportsbook
import Vapor

extension Market {

    static func all(forEvent eventID: Int, on request: Request) -> EventLoopFuture<[Market]> {
        request.marketService.fetchMarkets(forEvent: eventID)
            .mapEach(Market.init)
    }

    static func find(_ id: String, on request: Request) -> EventLoopFuture<Market?> {
        request.marketService.fetchMarket(withID: id)
            .optionalMap(Market.init)
    }

}
