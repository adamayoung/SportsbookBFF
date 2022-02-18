import SportsbookCore
import Vapor

public extension Sport {

    static func all(filter: SportsFilterConvertible? = nil, on request: Request) async throws -> [Sport] {
        try await request.sportService.sports(filter: filter?.sportsFilter)
            .map(Sport.init)
    }

    static func find(_ id: Sport.ID, on request: Request) async throws -> Sport? {
        guard let sport = try await request.sportService.sport(withID: id) else {
            return nil
        }

        return Sport(sport: sport)
    }

    static func find(forCompetition competitionID: Competition.ID, on request: Request) async throws -> Sport? {
        guard
            let competition = try await request.competitionService.competition(withID: competitionID),
            let sport = try await request.sportService.sport(withID: competition.sportID)
        else {
            return nil
        }

        return Sport(sport: sport)
    }

    static func find(forEvent eventID: Event.ID, on request: Request) async throws -> Sport? {
        guard
            let event = try await request.eventService.event(withID: eventID),
            let sport = try await request.sportService.sport(withID: event.sportID)
        else {
            return nil
        }

        return Sport(sport: sport)
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
