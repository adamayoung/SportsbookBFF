import SportsbookModels
import Vapor

public struct EventsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let eventTypes = routes.grouped("event-types")
        eventTypes.group(":eventTypeID") { eventType in
            eventType.get("events", use: indexFromEventType)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get("events", use: indexFromCompetition)
        }

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get(use: show)
        }

        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get("event", use: showForMarket)
        }
    }

    func indexFromEventType(request: Request) async throws ->RootAPIModel<[Event]> {
        guard let eventTypeID = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        let query = try request.query.decode(EventsFromEventTypeQuery.self)
        let events = try await Event.all(forEventType: eventTypeID, isInPlay: query.isInPlay, on: request)
        let model = RootAPIModel(data: events)
        return model
    }

    func indexFromCompetition(request: Request) async throws -> RootAPIModel<[Event]> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        let events = try await Event.all(forCompetition: competitionID, on: request)
        let model = RootAPIModel(data: events)
        return model
    }

    func show(request: Request) async throws -> RootAPIModel<Event> {
        guard let id = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        guard let event = try await Event.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: event)
        return model
    }

    func showForMarket(request: Request) async throws -> RootAPIModel<Event> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.internalServerError)
        }

        guard let event = try await Event.find(forMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: event)
        return model
    }

}

extension EventsController {

    struct EventsFromEventTypeQuery: Content {

        let isInPlay: Bool?

        init(isInPlay: Bool? = nil) {
            self.isInPlay = isInPlay
        }

    }

}
