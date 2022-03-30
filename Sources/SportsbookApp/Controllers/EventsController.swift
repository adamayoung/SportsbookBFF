import Sportsbook
import Vapor

struct EventsController: RouteCollection {

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

    func indexFromSport(request: Request) async throws -> RootDTO<[EventDTO]> {
        guard
            let sportID = request.parameters.get("sportID", as: Int.self),
            let sport = try await Sport.find(sportID, on: request)
        else {
            throw Abort(.notFound, reason: "Sport not found.")
        }

        let query = try request.query.decode(EventsFromSportQuery.self)
        let events = try await sport.events(isInPlay: query.isInPlay, on: request)
        let dtos = events.map(EventDTO.init)
        return RootDTO(data: dtos)
    }

    func indexFromCompetition(request: Request) async throws -> RootDTO<[EventDTO]> {
        guard
            let competitionID = request.parameters.get("competitionID", as: Int.self),
            let competition = try await Competition.find(competitionID, on: request)
        else {
            throw Abort(.notFound, reason: "Competition not found.")
        }

        let events = try await competition.events(on: request)
        let dtos = events.map(EventDTO.init)
        return RootDTO(data: dtos)
    }

    func show(request: Request) async throws -> RootDTO<EventDTO> {
        guard
            let id = request.parameters.get("eventID", as: Int.self),
            let event = try await Event.find(id, on: request)
        else {
            throw Abort(.notFound, reason: "Event not found.")
        }

        let dto = EventDTO(event: event)
        return RootDTO(data: dto)
    }

    func showFromMarket(request: Request) async throws -> RootDTO<EventDTO> {
        guard
            let marketID = request.parameters.get("marketID"),
            let market = try await Market.find(marketID, on: request)
        else {
            throw Abort(.notFound, reason: "Market not found.")
        }

        guard let event = try await market.event(on: request) else {
            throw Abort(.notFound, reason: "Event not found.")
        }

        let dto = EventDTO(event: event)
        return RootDTO(data: dto)
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
