import SportsbookModels
import Vapor

public struct SportsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.get(use: index)
        sports.get(":sportID", use: show)

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get("sport", use: showFromCompetition)
        }

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("sport", use: showFromEvent)
        }
    }

    func index(request: Request) async throws -> RootAPIModel<[Sport]> {
        let query = try request.query.decode(SportsQuery.self)
        let sports = try await Sport.all(filter: query, on: request)
        return RootAPIModel(data: sports)
    }

    func show(request: Request) async throws -> RootAPIModel<Sport> {
        guard let id = request.parameters.get("sportID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let sport = try await Sport.find(id, on: request) else {
            throw Abort(.notFound)
        }

        return RootAPIModel(data: sport)
    }

    func showFromCompetition(request: Request) async throws -> RootAPIModel<Sport> {
        guard let competitionID = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard
            let competition = try await Competition.find(competitionID, on: request),
            let sport = try await competition.sport(on: request)
        else {
            throw Abort(.notFound)
        }

        return RootAPIModel(data: sport)
    }

    func showFromEvent(request: Request) async throws -> RootAPIModel<Sport> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard
            let event = try await Event.find(eventID, on: request),
            let sport = try await event.sport(on: request)
        else {
            throw Abort(.notFound)
        }

        return RootAPIModel(data: sport)
    }

}
