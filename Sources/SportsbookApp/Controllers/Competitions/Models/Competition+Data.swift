import Sportsbook
import Vapor

extension Competition {

    static func all(forEventType eventTypeID: Int, on request: Request) -> EventLoopFuture<[Competition]> {
        request.competitionService.fetchCompetitions(forEventType: eventTypeID)
            .mapEach(Competition.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<Competition?> {
        request.competitionService.fetchCompetition(withID: id)
            .optionalMap(Competition.init)
    }

    static func find(eventID: Int, on request: Request) -> EventLoopFuture<Competition?> {
        request.eventService.fetchEvent(withID: eventID)
            .optionalMap(\.competitionID)
            .optionalFlatMap { request.competitionService.fetchCompetition(withID: $0) }
            .optionalMap(Competition.init)
    }

}
