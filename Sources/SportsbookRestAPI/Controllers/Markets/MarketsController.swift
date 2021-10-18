import Vapor

public struct MarketsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("markets", use: indexForEvents)
            event.webSocket("markets", "stream", onUpgrade: streamIndexForEvents)
        }

        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get(use: show)
        }
    }

    func indexForEvents(request: Request) throws -> EventLoopFuture<JSONAPIModel<[MarketModel]>> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.internalServerError)
        }

        return MarketModel.all(forEvent: eventID, on: request)
            .map(JSONAPIModel.init)
    }

    func streamIndexForEvents(request: Request, webSocket: WebSocket) {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            webSocket.close(code: .unacceptableData).whenComplete { _ in }
            return
        }

        let task = request.pollService.create("MarketsInEvent-\(eventID)", pollingFrequency: 5, webSocket: webSocket) {
            MarketModel.all(forEvent: eventID, on: request)
        }

        webSocket.onClose.whenComplete { _ in
            task.cancel()
        }
    }

    func show(request: Request) throws -> EventLoopFuture<JSONAPIModel<MarketModel>> {
        guard let id = request.parameters.get("marketID") else {
            throw Abort(.internalServerError)
        }

        return MarketModel.find(id, on: request)
            .unwrap(or: Abort(.notFound))
            .map(JSONAPIModel.init)
    }

}
