import Vapor

public struct CMSController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let cms = routes.grouped("cms")
        cms.get("featured", use: indexForFeatured)
        cms.get("popular", use: indexForPopular)
    }

    func indexForFeatured(request: Request) async throws -> JSONAPIModel<[MenuItem]> {
        let menuItems = try await MenuItem.featured(on: request)
        let model = JSONAPIModel(data: menuItems)
        return model
    }

    func indexForPopular(request: Request) async throws -> JSONAPIModel<[MenuItem]> {
        let menuItems = try await MenuItem.popular(on: request)
        let model = JSONAPIModel(data: menuItems)
        return model
    }

}
