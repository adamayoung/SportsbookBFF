import Vapor

public struct CMSController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let cms = routes.grouped("cms")
        cms.get("featured", use: indexForFeatured)
    }

    func indexForFeatured(request: Request) throws -> EventLoopFuture<JSONAPIModel<[MenuItemModel]>> {
        MenuItemModel.featured(on: request)
            .map(JSONAPIModel.init)
    }

}
