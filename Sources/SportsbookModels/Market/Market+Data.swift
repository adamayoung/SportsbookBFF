import SportsbookCore
import Vapor

public extension Market {

    static func all(forEvent eventID: Event.ID, marketType: String? = nil,
                    on request: Request) async throws -> [Market] {
        try await request.marketService.markets(forEvent: eventID)
            .compactMap {
                let market = Market(market: $0)
                guard let marketType = marketType else {
                    return market
                }

                return $0.marketType == marketType ? market : nil
            }
    }

    static func find(_ id: Market.ID, on request: Request) async throws -> Market? {
        try await request.marketService.market(withID: id)
            .map(Market.init)
    }

}

public extension Market {

    func event(on request: Request) async throws -> Event? {
        try await Event.find(eventID, on: request)
    }

    func competition(on request: Request) async throws -> Competition? {
        try await Competition.find(competitionID, on: request)
    }

    func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    func runner(_ selectionID: Runner.ID) -> Runner? {
        runners.first { $0.selectionID == selectionID }
    }

    func price(on request: Request) async throws -> MarketPrice? {
        try await MarketPrice.find(forMarket: id, on: request)
    }

}
