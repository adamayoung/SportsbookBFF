import Foundation
import SportsbookCore

struct MockMarketService: MarketService {

    let markets: [MarketDomainModel]

    init(markets: [MarketDomainModel]) {
        self.markets = markets
    }

    func fetchMarket(withID id: MarketDomainModel.ID) async throws -> MarketDomainModel? {
        markets.first { $0.id == id }
    }

    func fetchMarkets(forEvent eventID: Int) async throws -> [MarketDomainModel] {
        markets.filter { $0.eventID == eventID }
    }

}
