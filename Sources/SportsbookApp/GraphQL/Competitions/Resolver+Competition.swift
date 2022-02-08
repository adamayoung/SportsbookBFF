import Graphiti
import SportsbookCore
import Vapor

extension Resolver {

    func fetchCompetitions(request: Request,
                           arguments: CompetitionArguments) throws -> EventLoopFuture<[Competition]> {
        let promise = request.eventLoop.makePromise(of: [Competition].self)
        promise.completeWithTask {
            guard let competition = try await request.competitionService.competition(withID: arguments.id) else {
                return []
            }

            return [Competition(competition: competition)]
        }

        return promise.futureResult
    }

}
