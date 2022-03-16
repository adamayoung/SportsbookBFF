import Vapor

extension Competition {

    static func all(forSport sportID: Sport.ID, on request: Request) async throws -> [Competition]? {
        try await request.competitions.all(forSport: sportID, locale: request.locale)
    }

    static func find(_ id: Competition.ID, on request: Request) async throws -> Competition? {
        try await request.competitions.find(withID: id, locale: request.locale)
    }

    static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Competition? {
        try await request.competitions.find(forEvent: eventID, locale: request.locale)
    }

}

extension Competition {

    func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    func events(on request: Request) async throws -> [Event] {
        try await Event.all(forCompetition: id, on: request)
    }

}
