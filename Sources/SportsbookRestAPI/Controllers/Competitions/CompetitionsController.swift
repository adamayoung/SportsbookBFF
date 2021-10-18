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

    func indexForEventType(request: Request) throws -> EventLoopFuture<JSONAPIModel<[CompetitionModel]>> {
        guard let eventTypeID = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return CompetitionModel.all(forEventType: eventTypeID, on: request)
            .map(JSONAPIModel.init)
    }

    func show(request: Request) throws -> EventLoopFuture<JSONAPIModel<CompetitionModel>> {
        guard let id = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return CompetitionModel.find(id, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

    func showForEvent(request: Request) throws -> EventLoopFuture<JSONAPIModel<CompetitionModel>> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return CompetitionModel.find(eventID: eventID, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

}
