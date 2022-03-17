import Vapor

extension Competition {

    public static func all(forSport sportID: Sport.ID, on request: Request) async throws -> [Competition]? {
        try await request.competitions.all(forSport: sportID, locale: request.locale)
    }

    public static func find(_ id: Competition.ID, on request: Request) async throws -> Competition? {
        try await request.competitions.find(withID: id, locale: request.locale)
    }

    public static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Competition? {
        try await request.competitions.find(forEvent: eventID, locale: request.locale)
    }

}

extension Competition {

    public func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    public func events(on request: Request) async throws -> [Event] {
        try await Event.all(forCompetition: id, on: request)
    }

}
