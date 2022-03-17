import Vapor

extension Sport {

    public static func all(on request: Request) async throws -> [Sport] {
        return try await request.sports.all(locale: request.locale)
    }

    public static func popular(on request: Request) async throws -> [Sport] {
        try await request.sports.popular(locale: request.locale)
    }

    public static func find(_ id: Sport.ID, on request: Request) async throws -> Sport? {
        try await request.sports.find(withID: id, locale: request.locale)
    }

    public static func find(forCompetition competitionID: Competition.ID, on request: Request) async throws -> Sport? {
        try await request.sports.find(forCompetition: competitionID, locale: request.locale)
    }

    public static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Sport? {
        try await request.sports.find(forEvent: eventID, locale: request.locale)
    }

}

extension Sport {

    public func events(isInPlay: Bool? = nil, on request: Request) async throws -> [Event] {
        try await Event.all(forSport: id, isInPlay: isInPlay, on: request)
    }

}
