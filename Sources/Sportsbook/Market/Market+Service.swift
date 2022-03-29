import Vapor

extension Market {

    public static func all(forEvent eventID: Event.ID, on request: Request) async throws -> [Market] {
        try await request.markets.all(forEvent: eventID, locale: request.locale)
    }

    public static func find(_ id: Market.ID, on request: Request) async throws -> Market? {
        try await request.markets.find(withID: id, locale: request.locale)
    }

}

extension Market {

    public func event(on request: Request) async throws -> Event? {
        try await Event.find(eventID, on: request)
    }

    public func competition(on request: Request) async throws -> Competition? {
        try await Competition.find(competitionID, on: request)
    }

    public func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    public func runner(_ selectionID: MarketRunner.ID) -> MarketRunner? {
        runners.first { $0.selectionID == selectionID }
    }

    public func price(on request: Request) async throws -> MarketPrice? {
        try await MarketPrice.find(forMarket: id, on: request)
    }

}
