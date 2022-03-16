import Vapor

extension Market {

    static func all(forEvent eventID: Event.ID, marketType: String? = nil,
                    on request: Request) async throws -> [Market] {
        try await request.markets.all(forEvent: eventID, withMarketType: marketType, locale: request.locale)
    }

    static func find(_ id: Market.ID, on request: Request) async throws -> Market? {
        try await request.markets.find(withID: id, locale: request.locale)
    }

}

extension Market {

    func event(on request: Request) async throws -> Event? {
        try await Event.find(eventID, on: request)
    }

    func competition(on request: Request) async throws -> Competition? {
        try await Competition.find(competitionID, on: request)
    }

    func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    func runner(_ selectionID: MarketRunner.ID) -> MarketRunner? {
        runners.first { $0.selectionID == selectionID }
    }

    func price(on request: Request) async throws -> MarketPrice? {
        try await MarketPrice.find(forMarket: id, on: request)
    }

}
