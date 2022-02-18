import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchSports(request: Request, arguments: SportsArguments) throws -> EventLoopFuture<[Sport]> {
        let promise = request.eventLoop.makePromise(of: [Sport].self)
        promise.completeWithTask {
            let filter = arguments.sportsFilter

            guard let id = arguments.id else {
                return try await Sport.all(filter: filter, on: request)
            }

            guard let sport = try await Sport.find(id, on: request) else {
                return []
            }

            return [sport]
//                .filter(filter)
        }

        return promise.futureResult
    }

}
