import Vapor

extension Event {

    static func all(forSport sportID: Sport.ID, isInPlay: Bool?, on request: Request) async throws -> [Event] {
        try await request.events.all(forSport: sportID, isInPlay: isInPlay, locale: request.locale)
    }

    static func all(forCompetition competitionID: Competition.ID, on request: Request) async throws -> [Event] {
        try await request.events.all(forCompetition: competitionID, locale: request.locale)
    }

    static func find(_ id: Event.ID, on request: Request) async throws -> Event? {
        try await request.events.find(withID: id, locale: request.locale)
    }

    static func find(forMarket marketID: Market.ID, on request: Request) async throws -> Event? {
        try await request.events.find(forMarket: marketID, locale: request.locale)
    }

}

extension Event {

    func markets(marketType: String? = nil, on request: Request) async throws -> [Market] {
        try await Market.all(forEvent: id, marketType: marketType, on: request)
    }

    func competition(on request: Request) async throws -> Competition? {
        guard let competitionID = self.competitionID else {
            return nil
        }

        return try await Competition.find(competitionID, on: request)
    }

    func sport(on request: Request) async throws -> Sport? {
        try await Sport.find(sportID, on: request)
    }

}
