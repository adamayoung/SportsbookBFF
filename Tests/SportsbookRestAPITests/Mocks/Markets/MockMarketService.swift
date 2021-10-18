import Foundation
import NIO
import Sportsbook

struct MockMarketService: MarketService {

    let markets: [Market]
    private let eventLoop: EventLoop

    init(markets: [Market], eventLoop: EventLoop) {
        self.markets = markets
        self.eventLoop = eventLoop
    }

    func fetchMarket(withID id: Market.ID) -> EventLoopFuture<Market?> {
        let result = markets.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchMarkets(forEvent eventID: Int) -> EventLoopFuture<[Market]> {
        let result = markets.filter { $0.eventID == eventID }
        return eventLoop.makeSucceededFuture(result)
    }

}
