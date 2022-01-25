import Vapor

public struct OpportunitiesController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let opportunities = routes.grouped("opportunities")
        opportunities.get(use: index)
    }

    func index(request: Request) async throws -> JSONAPIModel<[Opportunity]> {
        let opportunity = try await Opportunity.all(on: request)
        let model = JSONAPIModel(data: opportunity)
        return model
    }

}
