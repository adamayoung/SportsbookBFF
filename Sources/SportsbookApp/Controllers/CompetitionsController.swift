import Sportsbook
import Vapor

struct CompetitionsController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.group(":sportID") { sport in
            sport.get("competitions", use: indexFromSport)
        }

        let competitions = routes.grouped("competitions")
        competitions.get(":competitionID", use: show)

        let events = routes.grouped("events")
        events.group(":eventID") { event in
            event.get("competition", use: showFromEvent)
        }
    }

    func indexFromSport(request: Request) async throws -> RootDTO<[CompetitionDTO]> {
        guard let sportID = request.parameters.get("sportID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let competitions = try await Competition.all(forSport: sportID, on: request) else {
            throw Abort(.notFound)
        }

        let dtos = competitions.map(CompetitionDTO.init)
        return RootDTO(data: dtos)
    }

    func show(request: Request) async throws -> RootDTO<CompetitionDTO> {
        guard let id = request.parameters.get("competitionID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let competition = try await Competition.find(id, on: request) else {
            throw Abort(.notFound)
        }

        let dto = CompetitionDTO(competition: competition)
        return RootDTO(data: dto)
    }

    func showFromEvent(request: Request) async throws -> RootDTO<CompetitionDTO> {
        guard let eventID = request.parameters.get("eventID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard
            let event = try await Event.find(eventID, on: request),
            let competition = try await event.competition(on: request)
        else {
            throw Abort(.notFound)
        }

        let dto = CompetitionDTO(competition: competition)
        return RootDTO(data: dto)
    }

}
