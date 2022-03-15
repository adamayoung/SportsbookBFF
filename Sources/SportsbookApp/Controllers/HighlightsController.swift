import Vapor

struct HighlightsController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let highlights = routes.grouped("highlights")
        highlights.get(use: index)
    }

    func index(request: Request) async throws -> RootAPIModel<[Highlight]> {
        let highlights = try await Highlight.all(on: request)

        return RootAPIModel(data: highlights)
    }

}
