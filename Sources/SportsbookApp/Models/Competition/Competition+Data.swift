import SportsbookCore
import Vapor

extension Competition {

    static func all(forSport sportID: Sport.ID, on request: Request) async throws -> [Competition]? {
        try await request.competitionService.competitions(forSport: sportID, locale: request.locale)?
            .map(Competition.init)
    }

    static func find(_ id: Competition.ID, on request: Request) async throws -> Competition? {
        try await request.competitionService.competition(withID: id, locale: request.locale)
            .map(Competition.init)
    }

    static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Competition? {
        try await request.competitionService.competition(forEvent: eventID, locale: request.locale)
            .map(Competition.init)
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
