import Foundation
import SportsbookCore

struct MockMarketService: MarketService {

    let markets: [MarketDomainModel]

    init(markets: [MarketDomainModel]) {
        self.markets = markets
    }

    func market(withID id: MarketDomainModel.ID, locale: Locale) async throws -> MarketDomainModel? {
        markets.first { $0.id == id }
    }

    func markets(forEvent eventID: Int, locale: Locale) async throws -> [MarketDomainModel] {
        markets.filter { $0.eventID == eventID }
    }

}
