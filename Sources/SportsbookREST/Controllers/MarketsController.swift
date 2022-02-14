import SportsbookModels
import Vapor

public struct MarketsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("markets", use: indexForEvents)
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

    func indexForEvents(request: Request) async throws -> RootAPIModel<[Market]> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.badRequest)
        }

        let markets = try await Market.all(forEvent: eventID, on: request)
        let model = RootAPIModel(data: markets)
        return model
    }

    func show(request: Request) async throws -> RootAPIModel<Market> {
        guard let id = request.parameters.get("marketID") else {
            throw Abort(.badRequest)
        }

        guard let market = try await Market.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: market)
        return model
    }

    func indexForRunners(request: Request) async throws -> RootAPIModel<[Runner]> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.badRequest)
        }

        guard let runners = try await Runner.all(forMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: runners)
        return model
    }

    func showRunner(request: Request) async throws -> RootAPIModel<Runner> {
        guard
            let marketID = request.parameters.get("marketID"),
            let selectionID = request.parameters.get("selectionID", as: Int.self)
        else {
            throw Abort(.badRequest)
        }

        guard let runner = try await Runner.find(withSelection: selectionID, inMarket: marketID, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: runner)
        return model
    }

}
