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

            let runners = market.grouped("runners")
            runners.get(use: indexForRunners)
            runners.group(":selectionID") { runner in
                runner.get(use: showRunner)
            }
        }
    }

    func indexForEvents(request: Request) async throws -> JSONAPIModel<[Market]> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.badRequest)
        }

        let markets = try await Market.all(forEvent: eventID, on: request)
        let model = JSONAPIModel(data: markets)
        return model
    }

    func streamIndexForEvents(request: Request, webSocket: WebSocket) {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            webSocket.close(code: .unacceptableData).whenComplete { _ in }
            return
        }

        let task = request.pollService.create("MarketsInEvent-\(eventID)", pollingFrequency: 5, webSocket: webSocket) {
            Market.all(forEvent: eventID, on: request)
        }

        webSocket.onClose.whenComplete { _ in
            task.cancel()
        }
    }

    func show(request: Request) async throws -> JSONAPIModel<Market> {
        guard let id = request.parameters.get("marketID") else {
            throw Abort(.badRequest)
        }

        guard let market = try await Market.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = JSONAPIModel(data: market)
        return model
    }

    func indexForRunners(request: Request) async throws -> JSONAPIModel<[Runner]> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.badRequest)
        }

        guard let runners = try await Runner.all(forMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = JSONAPIModel(data: runners)
        return model
    }

    func showRunner(request: Request) async throws -> JSONAPIModel<Runner> {
        guard
            let marketID = request.parameters.get("marketID"),
            let selectionID = request.parameters.get("selectionID", as: Int.self)
        else {
            throw Abort(.badRequest)
        }

        guard let runner = try await Runner.find(withSelection: selectionID, inMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = JSONAPIModel(data: runner)
        return model
    }

}
