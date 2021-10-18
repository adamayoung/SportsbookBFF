import Foundation
import NIO
import Sportsbook

struct MockEventService: EventService {

    let events: [Event]
    private let eventLoop: EventLoop

    init(events: [Event], eventLoop: EventLoop) {
        self.events = events
        self.eventLoop = eventLoop
    }

    func fetchEvent(withID id: Event.ID) -> EventLoopFuture<Event?> {
        let result = events.first { $0.id == id }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchEvents(forCompetition competitionID: Int) -> EventLoopFuture<[Event]> {
        let result = events.filter { $0.competitionID == competitionID }
        return eventLoop.makeSucceededFuture(result)
    }

    func fetchEvents(forEventType eventTypeID: Int, isInPlay: Bool?) -> EventLoopFuture<[Event]> {
        let result = events
            .filter { $0.eventTypeID == eventTypeID }
            .filter {
                guard let isInPlay = isInPlay else {
                    return true
                }

                return $0.isInPlay == isInPlay
            }
        return eventLoop.makeSucceededFuture(result)
    }

}
