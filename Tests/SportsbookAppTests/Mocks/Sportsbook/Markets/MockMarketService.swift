import Foundation
@testable import SportsbookApp

struct MockMarketService: MarketProvider {

    let markets: [MarketDomainModel]

    init(markets: [MarketDomainModel]) {
        self.markets = markets
    }

    func find(withID id: MarketDomainModel.ID, locale: Locale) async throws -> MarketDomainModel? {
        markets.first { $0.id == id }
    }

    func all(forEvent eventID: Int, locale: Locale) async throws -> [MarketDomainModel] {
        markets.filter { $0.eventID == eventID }
    }

    func all(forEvents eventIDs: [Int], locale: Locale) async throws -> [EventDomainModel.ID: [MarketDomainModel]] {
        return [:]
    }

}
