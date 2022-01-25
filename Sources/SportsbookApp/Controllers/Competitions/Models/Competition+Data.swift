import Sportsbook
import Vapor

extension Competition {

    static func all(forEventType eventTypeID: Int, on request: Request) async throws -> [Competition] {
        try await request.competitionService.fetchCompetitions(forEventType: eventTypeID)
            .map(Competition.init)
    }

    static func find(_ id: Int, on request: Request) async throws -> Competition? {
        guard let competition = try await request.competitionService.fetchCompetition(withID: id) else {
            return nil
        }

        return Competition(competition: competition)
    }

    static func find(eventID: Int, on request: Request) async throws -> Competition? {
        guard
            let event = try await request.eventService.fetchEvent(withID: eventID),
            let competitionID = event.competitionID,
            let competition = try await request.competitionService.fetchCompetition(withID: competitionID)
        else {
            return nil
        }

        return Competition(competition: competition)
    }

}
