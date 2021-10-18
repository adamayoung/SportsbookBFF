import Sportsbook
import Vapor

extension MarketModel {

    static func all(forEvent eventID: Int, on request: Request) -> EventLoopFuture<[MarketModel]> {
        request.marketService.fetchMarkets(forEvent: eventID)
            .mapEach(MarketModel.init)
    }

    static func find(_ id: String, on request: Request) -> EventLoopFuture<MarketModel?> {
        request.marketService.fetchMarket(withID: id)
            .optionalMap(MarketModel.init)
    }

}
