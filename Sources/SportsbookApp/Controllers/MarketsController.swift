import Sportsbook
import Vapor

struct MarketsController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("markets", use: indexForEvents)
        }

        let markets = routes.grouped("markets")
        markets.group(":marketID") { market in
            market.get(use: show)

            let runners = market.grouped("runners")
            runners.get(use: indexForRunners)
            runners.get(":selectionID", use: showRunner)
        }
    }

    func indexForEvents(request: Request) async throws -> RootDTO<[MarketDTO]> {
        guard
            let eventID = request.parameters.get("eventID", as: Int.self),
            let event = try await Event.find(eventID, on: request)
        else {
            throw Abort(.notFound, reason: "Event not found.")
        }

        let markets = try await event.markets(on: request)
        let dtos = markets.map(MarketDTO.init)
        return RootDTO(data: dtos)
    }

    func show(request: Request) async throws -> RootDTO<MarketDTO> {
        guard
            let id = request.parameters.get("marketID"),
            let market = try await Market.find(id, on: request)
        else {
            throw Abort(.notFound, reason: "Market not found.")
        }

        let dto = MarketDTO(market: market)
        return RootDTO(data: dto)
    }

    func indexForRunners(request: Request) async throws -> RootDTO<[RunnerDTO]> {
        guard
            let marketID = request.parameters.get("marketID"),
            let market = try await Market.find(marketID, on: request)
        else {
            throw Abort(.notFound, reason: "Market not found.")
        }

        let dtos = market.runners.map(RunnerDTO.init)
        return RootDTO(data: dtos)
    }

    func showRunner(request: Request) async throws -> RootDTO<RunnerDTO> {
        guard let marketID = request.parameters.get("marketID") else {
            throw Abort(.notFound, reason: "Market not found.")
        }

        guard
            let selectionID = request.parameters.get("selectionID", as: Int.self),
            let runner = try await Market.find(marketID, on: request)?.runner(selectionID)
        else {
            throw Abort(.notFound, reason: "Runner not found.")
        }

        let dto = RunnerDTO(runner: runner)
        return RootDTO(data: dto)
    }

}
