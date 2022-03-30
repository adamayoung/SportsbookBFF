import Foundation
import Sportsbook

struct MockMarketService: MarketService {

    let markets: [Market]

    init(markets: [Market]) {
        self.markets = markets
    }

    func find(withID id: Market.ID, locale: Locale) async throws -> Market? {
        markets.first { $0.id == id }
    }

    func primary(forEvent eventID: Event.ID, locale: Locale) async throws -> Market? {
        return nil
    }

    func all(forEvent eventID: Int, locale: Locale) async throws -> [Market] {
        markets.filter { $0.eventID == eventID }
    }

    func all(forEvents eventIDs: [Int], locale: Locale) async throws -> [Event.ID: [Market]] {
        return [:]
    }

}
