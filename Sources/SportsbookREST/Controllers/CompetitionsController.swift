import SportsbookModels
import Vapor

public struct CompetitionsController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.group(":sportID") { sport in
            sport.get("competitions", use: indexFromSport)
        }

        let competitions = routes.grouped("competitions")
        competitions.group(":competitionID") { competition in
            competition.get(use: show)
        }

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("competition", use: showFromEvent)
        }
    }

    func indexFromSport(request: Request) async throws -> RootAPIModel<[Competition]> {
        guard let sportID = request.parameters.get("sportID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let sport = try await Sport.find(sportID, on: request) else {
            throw Abort(.notFound)
        }

        let competitions = try await sport.competitions(on: request)
        let model = RootAPIModel(data: competitions)
        return model
    }

    func show(request: Request) async throws -> RootAPIModel<Competition> {
        guard let id = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let competition = try await Competition.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: competition)
        return model
    }

    func showFromEvent(request: Request) async throws -> RootAPIModel<Competition> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard
            let event = try await Event.find(eventID, on: request),
            let competition = try await event.competition(on: request)
        else {
            throw Abort(.notFound)
        }

        let model = RootAPIModel(data: competition)
        return model
    }

}
