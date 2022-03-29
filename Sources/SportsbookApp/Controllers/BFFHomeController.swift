import Sportsbook
import Vapor

struct BFFHomeController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        routes.get("home", use: index)
    }

    func index(request: Request) async throws -> RootDTO<HomeDTO> {
        async let sports = Sport.all(on: request)
        async let popular = Sport.popular(on: request)
        let dto = try HomeDTO(sports: await sports, popular: await popular)
        return RootDTO(data: dto)
    }

}
