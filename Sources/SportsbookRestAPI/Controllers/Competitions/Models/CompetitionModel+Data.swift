import Sportsbook
import Vapor

extension CompetitionModel {

    static func all(forEventType eventTypeID: Int, on request: Request) -> EventLoopFuture<[CompetitionModel]> {
        request.competitionService.fetchCompetitions(forEventType: eventTypeID)
            .mapEach(CompetitionModel.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<CompetitionModel?> {
        request.competitionService.fetchCompetition(withID: id)
            .optionalMap(CompetitionModel.init)
    }

    static func find(eventID: Int, on request: Request) -> EventLoopFuture<CompetitionModel?> {
        request.eventService.fetchEvent(withID: eventID)
            .optionalMap(\.competitionID)
            .optionalFlatMap { request.competitionService.fetchCompetition(withID: $0) }
            .optionalMap(CompetitionModel.init)
    }

}
