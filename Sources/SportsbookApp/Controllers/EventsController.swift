import Vapor

struct EventsController: RouteCollection {

    init() { }

    func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.group(":sportID") { sport in
            sport.get("events", use: indexFromSport)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get("events", use: indexFromCompetition)
        }

        let events = routes.grouped("events")
        events.get(":eventID", use: show)

        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get("event", use: showFromMarket)
        }
    }

    func indexFromSport(request: Request) async throws -> RootAPIModel<[Event]> {
        guard let sportID = request.parameters.get("sportID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let sport = try await Sport.find(sportID, on: request) else {
            throw Abort(.notFound)
        }

        let query = try request.query.decode(EventsFromSportQuery.self)
        let events = try await sport.events(isInPlay: query.isInPlay, on: request)
        return RootAPIModel(data: events)
    }

    func indexFromCompetition(request: Request) async throws -> RootAPIModel<[Event]> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let competition = try await Competition.find(competitionID, on: request) else {
            throw Abort(.notFound)
        }

        let events = try await competition.events(on: request)
        return RootAPIModel(data: events)
    }

    func show(request: Request) async throws -> RootAPIModel<Event> {
        guard let id = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let event = try await Event.find(id, on: request) else {
            throw Abort(.notFound)
        }

        return RootAPIModel(data: event)
    }

    func showFromMarket(request: Request) async throws -> RootAPIModel<Event> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.notFound)
        }

        guard
            let market = try await Market.find(marketID, on: request),
            let event = try await market.event(on: request)
        else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: event)
        return model
    }

}

extension EventsController {

    struct EventsFromSportQuery: Content {

        let isInPlay: Bool?

        init(isInPlay: Bool? = nil) {
            self.isInPlay = isInPlay
        }

    }

}
