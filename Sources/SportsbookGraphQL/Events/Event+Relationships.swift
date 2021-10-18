import Graphiti
import Sportsbook
import Vapor

extension Event {

    func markets(request: Request, arguments: MarketsArguments) throws -> EventLoopFuture<[Market]> {
        request.marketService.fetchMarkets(forEvent: self.id)
            .map { markets in
                guard let marketID = arguments.id else {
                    return markets
                }

                return markets.filter { $0.id == marketID }
            }
    }

    func competition(request: Request, arguments: NoArguments) throws -> EventLoopFuture<Competition?> {
        guard let competitionID = self.competitionID else {
            return request.eventLoop.makeSucceededFuture(nil)
        }

        return request.competitionService.fetchCompetition(withID: competitionID)
    }

    func eventType(request: Request, arguments: NoArguments) throws -> EventLoopFuture<EventType?> {
        request.eventTypeService.fetchEventType(withID: self.eventTypeID)
    }

}
