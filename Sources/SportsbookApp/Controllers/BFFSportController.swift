import Sportsbook
import Vapor

struct BFFSportHomeController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let sports = routes.grouped("sports")
        sports.get(":sportID", use: index)
    }

    func index(request: Request) async throws -> RootDTO<SportHomeDTO> {
        guard let sportID = request.parameters.get("sportID", as: Int.self) else {
            throw Abort(.notFound)
        }

        guard let sport = try await Sport.find(sportID, on: request) else {
            throw Abort(.notFound)
        }

        async let competitions = Competition.all(forSport: sportID, on: request) ?? []
        async let inPlayEvents = Event.all(forSport: sport.id, isInPlay: true, on: request)
        let dto = try SportHomeDTO(sport: sport, events: await inPlayEvents, competitions: await competitions)
        return RootDTO(data: dto)
    }

}
