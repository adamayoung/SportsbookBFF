import Vapor

public struct CompetitionsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let eventTypes = routes.grouped("event-types")
        eventTypes.group(":eventTypeID") { eventType in
            eventType.get("competitions", use: indexForEventType)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get(use: show)
        }

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("competition", use: showForEvent)
        }
    }

    func indexForEventType(request: Request) async throws -> JSONAPIModel<[Competition]> {
        guard let eventTypeID = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        let competitions = try await Competition.all(forEventType: eventTypeID, on: request)
        let model = JSONAPIModel(data: competitions)
        return model
    }

    func show(request: Request) async throws -> JSONAPIModel<Competition> {
        guard let id = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        guard let competition = try await Competition.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = JSONAPIModel(data: competition)
        return model
    }

    func showForEvent(request: Request) async throws -> JSONAPIModel<Competition> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        guard let competition = try await Competition.find(eventID: eventID, on: request) else {
            throw Abort(.notFound)
        }

        let model = JSONAPIModel(data: competition)
        return model
    }

}
