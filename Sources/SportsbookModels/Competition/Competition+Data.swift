import SportsbookCore
import Vapor

public extension Competition {

    static func all(forSport sportID: Sport.ID, on request: Request) async throws -> [Competition] {
        try await request.competitionService.competitions(forSport: sportID)
            .map(Competition.init)
    }

    static func find(_ id: Competition.ID, on request: Request) async throws -> Competition? {
        guard let competition = try await request.competitionService.competition(withID: id) else {
            return nil
        }

        return Competition(competition: competition)
    }

    static func find(eventID: Event.ID, on request: Request) async throws -> Competition? {
        guard
            let event = try await request.eventService.event(withID: eventID),
            let competitionID = event.competitionID,
            let competition = try await request.competitionService.competition(withID: competitionID)
        else {
            return nil
        }

        return Competition(competition: competition)
    }

}

public extension Competition {

    func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

    func events(on request: Request) async throws -> [Event] {
        try await Event.all(forCompetition: id, on: request)
    }

}
