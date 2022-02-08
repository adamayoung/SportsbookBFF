import SportsbookCore
import Vapor

extension Event {

    static func all(forEventType eventTypeID: Int, isInPlay: Bool?, on request: Request) async throws -> [Event] {
        try await request.eventService.events(forEventType: eventTypeID, isInPlay: isInPlay)
            .map(Event.init)
    }

    static func all(forCompetition competitionID: Int, on request: Request) async throws -> [Event] {
        try await request.eventService.events(forCompetition: competitionID)
            .map(Event.init)
    }

    static func all(forCompetition competitionID: Int, on request: Request) -> EventLoopFuture<[Event]> {
        let promise = request.eventLoop.makePromise(of: [Event].self)
        promise.completeWithTask {
            try await all(forCompetition: competitionID, on: request)
        }

        return promise.futureResult
    }

    static func find(_ id: Int, on request: Request) async throws -> Event? {
        try await request.eventService.event(withID: id)
            .map(Event.init)
    }

    static func find(forMarket marketID: String, on request: Request) async throws -> Event? {
        guard
            let market = try await request.marketService.market(withID: marketID),
            let event = try await request.eventService.event(withID: market.eventID)
        else {
            return nil
        }

        return Event(event: event)
    }

}
