import SportsbookCore
import Vapor

extension Sport {

    static func all(on request: Request) async throws -> [Sport] {
        return try await request.sportService.sports(locale: request.locale)
            .map(Sport.init)
    }

    static func popular(on request: Request) async throws -> [Sport] {
        try await request.sportService.popularSports(locale: request.locale)
            .map(Sport.init)
    }

    static func find(_ id: Sport.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(withID: id, locale: request.locale)
            .map(Sport.init)
    }

    static func find(forCompetition competitionID: Competition.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(forCompetition: competitionID, locale: request.locale)
            .map(Sport.init)
    }

    static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Sport? {
        try await request.sportService.sport(forEvent: eventID, locale: request.locale)
            .map(Sport.init)
    }

}

extension Sport {

    func competitions(on request: Request) async throws -> [Competition]? {
        try await Competition.all(forSport: id, on: request)
    }

    func events(isInPlay: Bool? = nil, on request: Request) async throws -> [Event] {
        try await Event.all(forSport: id, isInPlay: isInPlay, on: request)
    }

}
