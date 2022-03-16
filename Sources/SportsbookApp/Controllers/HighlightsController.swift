import Vapor

struct HighlightsController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let highlights = routes.grouped("highlights")
        highlights.get(use: index)
    }

    func index(request: Request) async throws -> RootDTO<[HighlightDTO]> {
        let highlights = [HighlightDTO(sport: SportDTO(id: 1, name: "Football"), events: [], markets: [:])]

        return RootDTO(data: highlights)
    }

}
