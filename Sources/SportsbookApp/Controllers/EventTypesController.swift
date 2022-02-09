import SportsbookModels
import Vapor

public struct EventTypesController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let eventTypes = routes.grouped("event-types")
        eventTypes.get(use: index)
        eventTypes.group(":eventTypeID") { eventType in
            eventType.get(use: show)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get("event-type", use: showForCompetition)
        }

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("event-type", use: showForEvent)
        }
    }

    func index(request: Request) async throws -> RootAPIModel<[EventType]> {
        let query = try request.query.decode(EventTypesQuery.self)
        let eventTypes = try await EventType.all(filter: query, on: request)
        let model = RootAPIModel(data: eventTypes)
        return model
    }

    func show(request: Request) async throws -> RootAPIModel<EventType> {
        guard let id = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.badRequest)
        }

        guard let eventType = try await EventType.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: eventType)
        return model
    }

    func showForCompetition(request: Request) async throws -> RootAPIModel<EventType> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        guard let eventType = try await EventType.find(forCompetition: competitionID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: eventType)
        return model
    }

    func showForEvent(request: Request) async throws -> RootAPIModel<EventType> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        guard let eventType = try await EventType.find(forEvent: eventID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: eventType)
        return model
    }

}
