import Vapor

struct SportsController: RouteCollection {

    init() { }

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

    func index(request: Request) async throws -> RootAPIModel<[Sport]> {
        let sports = try await Sport.all(on: request)
        return RootAPIModel(data: sports)
    }

    func indexForPopular(request: Request) async throws -> RootAPIModel<[Sport]> {
        let sports = try await Sport.popular(on: request)
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
