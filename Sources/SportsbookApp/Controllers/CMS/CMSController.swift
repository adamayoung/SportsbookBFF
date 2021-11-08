import Vapor

public struct CMSController: RouteCollection {

    public init() { }

    public func boot(routes: RoutesBuilder) throws {
        let cms = routes.grouped("cms")
        cms.get("featured", use: indexForFeatured)
        cms.get("popular", use: indexForPopular)
    }

    func indexForFeatured(request: Request) throws -> EventLoopFuture<JSONAPIModel<[MenuItem]>> {
        MenuItem.featured(on: request)
            .map(JSONAPIModel.init)
    }

    func indexForPopular(request: Request) throws -> EventLoopFuture<JSONAPIModel<[MenuItem]>> {
        MenuItem.popular(on: request)
            .map(JSONAPIModel.init)
    }

}
