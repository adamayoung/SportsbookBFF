import Sportsbook
import Vapor

struct SportsController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.get(use: index)
        sports.get("popular", use: indexForPopular)
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

    func index(request: Request) async throws -> RootDTO<[SportDTO]> {
        let sports = try await Sport.all(on: request)
        let dtos = sports.map(SportDTO.init)
        return RootDTO(data: dtos)
    }

    func indexForPopular(request: Request) async throws -> RootDTO<[SportDTO]> {
        let sports = try await Sport.popular(on: request)
        let dtos = sports.map(SportDTO.init)
        return RootDTO(data: dtos)
    }

    func show(request: Request) async throws -> RootDTO<SportDTO> {
        guard
            let id = request.parameters.get("sportID", as: Int.self),
            let sport = try await Sport.find(id, on: request)
        else {
            throw Abort(.notFound, reason: "Sport not found.")
        }

        let dto = SportDTO(sport: sport)
        return RootDTO(data: dto)
    }

    func showFromCompetition(request: Request) async throws -> RootDTO<SportDTO> {
        guard
            let competitionID = request.parameters.get("competitionID", as: Int.self),
            let competition = try await Competition.find(competitionID, on: request)
        else {
            throw Abort(.notFound, reason: "Competition not found.")
        }

        guard let sport = try await competition.sport(on: request) else {
            throw Abort(.notFound, reason: "Sport not found.")
        }

        let dto = SportDTO(sport: sport)
        return RootDTO(data: dto)
    }

    func showFromEvent(request: Request) async throws -> RootDTO<SportDTO> {
        guard
            let eventID = request.parameters.get("eventID", as: Int.self),
            let event = try await Event.find(eventID, on: request)
        else {
            throw Abort(.notFound, reason: "Event not found.")
        }

        guard let sport = try await event.sport(on: request) else {
            throw Abort(.notFound, reason: "Sport not found.")
        }

        let dto = SportDTO(sport: sport)
        return RootDTO(data: dto)
    }

}
