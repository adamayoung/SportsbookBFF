import SportsbookCore
import Vapor

public extension Market {

    static func all(forEvent eventID: Int, marketType: String? = nil, on request: Request) async throws -> [Market] {
        try await request.marketService.markets(forEvent: eventID)
            .compactMap {
                guard let marketType = marketType else {
                    return Market(market: $0)
                }

                return $0.marketType == marketType ? Market(market: $0) : nil
            }
    }

    static func find(_ id: String, on request: Request) async throws -> Market? {
        guard let market = try await request.marketService.market(withID: id) else {
            return nil
        }

        return Market(market: market)
    }

}

public extension Market {

    func event(on request: Request) async throws -> Event? {
        try await Event.find(eventID, on: request)
    }

    func competition(on request: Request) async throws -> Competition? {
        try await Competition.find(competitionID, on: request)
    }

    func eventType(on request: Request) async throws -> EventType? {
        try await EventType.find(eventTypeID, on: request)
    }

    func price(on request: Request) async throws -> MarketPrice? {
        try await MarketPrice.find(forMarket: id, on: request)
    }

}
