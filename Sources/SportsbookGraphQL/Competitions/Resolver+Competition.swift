import Graphiti
import Sportsbook
import Vapor

extension Resolver {

    func fetchCompetitions(request: Request, arguments: CompetitionArguments) throws -> EventLoopFuture<[Competition]> {
        request.competitionService.fetchCompetition(withID: arguments.id)
            .optionalMap { [$0] }
            .unwrap(orReplace: [])
    }

}
