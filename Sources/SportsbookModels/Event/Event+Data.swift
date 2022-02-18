import SportsbookCore
import Vapor

extension Event {

    public static func all(forSport sportID: Sport.ID, isInPlay: Bool?, on request: Request) async throws -> [Event] {
        try await request.eventService.events(forSport: sportID, isInPlay: isInPlay)
            .map(Event.init)
    }

    public static func all(forCompetition competitionID: Competition.ID, on request: Request) async throws -> [Event] {
        try await request.eventService.events(forCompetition: competitionID)
            .map(Event.init)
    }

    public static func find(_ id: Event.ID, on request: Request) async throws -> Event? {
        try await request.eventService.event(withID: id)
            .map(Event.init)
    }

    public static func find(forMarket marketID: Market.ID, on request: Request) async throws -> Event? {
        guard
            let market = try await request.marketService.market(withID: marketID),
            let event = try await request.eventService.event(withID: market.eventID)
        else {
            return nil
        }

        return Event(event: event)
    }

}

extension Event {

    public func markets(marketType: String? = nil, on request: Request) async throws -> [Market] {
        try await Market.all(forEvent: id, marketType: marketType, on: request)
    }

    public func competition(on request: Request) async throws -> Competition? {
        guard let competitionID = self.competitionID else {
            return nil
        }

        return try await Competition.find(competitionID, on: request)
    }

    public func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

}
