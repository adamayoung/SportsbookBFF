import SportsbookCore
import Vapor

public extension Sport {

    static func all(filter: SportsFilterConvertible? = nil, on request: Request) async throws -> [Sport] {
        try await request.sportService.sports(filter: filter?.sportsFilter)
            .map(Sport.init)
    }

    static func find(_ id: Sport.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(withID: id)
            .map(Sport.init)
    }

    static func find(forCompetition competitionID: Competition.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(forCompetition: competitionID)
            .map(Sport.init)
    }

    static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(forEvent: eventID)
            .map(Sport.init)
    }

}

public extension Sport {

    func competitions(on request: Request) async throws -> [Competition] {
        try await Competition.all(forSport: id, on: request)
    }

    func events(isInPlay: Bool? = nil, on request: Request) async throws -> [Event] {
        try await Event.all(forSport: id, isInPlay: isInPlay, on: request)
    }

}
