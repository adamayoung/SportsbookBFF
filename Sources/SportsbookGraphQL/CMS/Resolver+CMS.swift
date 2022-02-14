import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchFeatured(request: Request, arguments: NoArguments) throws -> EventLoopFuture<[MenuItem]> {
        let promise = request.eventLoop.makePromise(of: [MenuItem].self)
        promise.completeWithTask {
            try await MenuItem.featured(on: request)
        }

        return promise.futureResult
    }

    func fetchPopular(request: Request, arguments: NoArguments) throws -> EventLoopFuture<[MenuItem]> {
        let promise = request.eventLoop.makePromise(of: [MenuItem].self)
        promise.completeWithTask {
            try await MenuItem.popular(on: request)
        }

        return promise.futureResult
    }

}
