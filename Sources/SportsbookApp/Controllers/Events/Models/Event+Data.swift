import Sportsbook
import Vapor

extension Event {

    static func all(forEventType eventTypeID: Int, isInPlay: Bool?,
                    on request: Request) -> EventLoopFuture<[Event]> {
        request.eventService.fetchEvents(forEventType: eventTypeID, isInPlay: isInPlay)
            .mapEach(Event.init)
    }

    static func all(forCompetition competitionID: Int, on request: Request) -> EventLoopFuture<[Event]> {
        request.eventService.fetchEvents(forCompetition: competitionID)
            .mapEach(Event.init)
    }

    static func find(_ id: Int, on request: Request) -> EventLoopFuture<Event?> {
        request.eventService.fetchEvent(withID: id)
            .optionalMap(Event.init)
    }

    static func find(forMarket marketID: String, on request: Request) -> EventLoopFuture<Event?> {
        request.marketService.fetchMarket(withID: marketID)
            .map { $0?.eventID }
            .optionalFlatMap { request.eventService.fetchEvent(withID: $0) }
            .optionalMap(Event.init)
    }

}
