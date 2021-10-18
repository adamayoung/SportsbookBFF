import Vapor

public struct EventsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let eventTypes = routes.grouped("event-types")
        eventTypes.group(":eventTypeID") { eventType in
            eventType.get("events", use: indexForEventType)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get("events", use: indexForCompetition)
            competition.webSocket("events", "stream", onUpgrade: streamIndexForCompetition)
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

    func indexForEventType(request: Request) throws -> EventLoopFuture<JSONAPIModel<[EventModel]>> {
        guard let eventTypeID = request.parameters.get("eventTypeID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        let query = try request.query.decode(EventTypeIndexQuery.self)

        return EventModel.all(forEventType: eventTypeID, isInPlay: query.isInPlay, on: request)
            .map(JSONAPIModel.init)
    }

    func indexForCompetition(request: Request) throws -> EventLoopFuture<JSONAPIModel<[EventModel]>> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return EventModel.all(forCompetition: competitionID, on: request)
            .map(JSONAPIModel.init)
    }

    func streamIndexForCompetition(request: Request, webSocket: WebSocket) {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            webSocket.close(code: .unacceptableData).whenComplete { _ in }
            return
        }

        let task = request.pollService.create("EventsInCompetition-\(competitionID)", pollingFrequency: 5,
                                           webSocket: webSocket) {
            EventModel.all(forCompetition: competitionID, on: request)
        }

        webSocket.onClose.whenComplete { _ in
            task.cancel()
        }
    }

    func show(request: Request) throws -> EventLoopFuture<JSONAPIModel<EventModel>> {
        guard let id = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return EventModel.find(id, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

    func showForMarket(request: Request) throws -> EventLoopFuture<JSONAPIModel<EventModel>> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.internalServerError)
        }

        return EventModel.find(forMarket: marketID, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

}

private struct EventTypeIndexQuery: Content {

    let isInPlay: Bool?

}
