import Foundation
import NIO
import Sportsbook

struct MockMarketService: MarketService {

    let markets: [MarketDomainModel]
    private let eventLoop: EventLoop

    init(markets: [MarketDomainModel], eventLoop: EventLoop) {
        self.markets = markets
        self.eventLoop = eventLoop
    }

    func fetchMarket(withID id: MarketDomainModel.ID) -> EventLoopFuture<MarketDomainModel?> {
        let result = markets.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchMarkets(forEvent eventID: Int) -> EventLoopFuture<[MarketDomainModel]> {
        let result = markets.filter { $0.eventID == eventID }
        return eventLoop.makeSucceededFuture(result)
    }

}
