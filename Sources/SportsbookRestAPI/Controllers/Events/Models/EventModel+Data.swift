import Sportsbook
import Vapor

extension EventModel {

    static func all(forEventType eventTypeID: Int, isInPlay: Bool?,
                    on request: Request) -> EventLoopFuture<[EventModel]> {
        request.eventService.fetchEvents(forEventType: eventTypeID, isInPlay: isInPlay)
            .mapEach(EventModel.init)
    }

    static func all(forCompetition competitionID: Int, on request: Request) -> EventLoopFuture<[EventModel]> {
        request.eventService.fetchEvents(forCompetition: competitionID)
            .mapEach(EventModel.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<EventModel?> {
        request.eventService.fetchEvent(withID: id)
            .optionalMap(EventModel.init)
    }

    static func find(forMarket marketID: String, on request: Request) -> EventLoopFuture<EventModel?> {
        request.marketService.fetchMarket(withID: marketID)
            .map { $0?.eventID }
            .optionalFlatMap { request.eventService.fetchEvent(withID: $0) }
            .optionalMap(EventModel.init)
    }

}
