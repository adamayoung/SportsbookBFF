import Graphiti
import SportsbookModels
import Vapor

extension Resolver {

    func fetchCompetitions(request: Request,
                           arguments: CompetitionArguments) throws -> EventLoopFuture<[Competition]> {
        let promise = request.eventLoop.makePromise(of: [Competition].self)
        promise.completeWithTask {
            guard let competition = try await Competition.find(arguments.id, on: request) else {
                return []
            }

            return [competition]
        }

        return promise.futureResult
    }

}
