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

    func indexForEventType(request: Request) throws -> EventLoopFuture<JSONAPIModel<[Competition]>> {
        guard let eventTypeID = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return Competition.all(forEventType: eventTypeID, on: request)
            .map(JSONAPIModel.init)
    }

    func show(request: Request) throws -> EventLoopFuture<JSONAPIModel<Competition>> {
        guard let id = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return Competition.find(id, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

    func showForEvent(request: Request) throws -> EventLoopFuture<JSONAPIModel<Competition>> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return Competition.find(eventID: eventID, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

}
