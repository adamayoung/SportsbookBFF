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

    func index(request: Request) throws -> EventLoopFuture<JSONAPIModel<[EventTypeModel]>> {
        request.eventTypeService.fetchEventTypes()
            .mapEach(EventTypeModel.init)
            .map(JSONAPIModel.init)
    }

    func show(request: Request) throws -> EventLoopFuture<JSONAPIModel<EventTypeModel>> {
        guard let id = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return EventTypeModel.find(id, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

    func showForCompetition(request: Request) throws -> EventLoopFuture<JSONAPIModel<EventTypeModel>> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return EventTypeModel.find(forCompetition: competitionID, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

    func showForEvent(request: Request) throws -> EventLoopFuture<JSONAPIModel<EventTypeModel>> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return EventTypeModel.find(forEvent: eventID, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

}
