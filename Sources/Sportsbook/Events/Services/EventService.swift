import Foundation
import NIO

public protocol EventService {

    func fetchEvent(withID id: Event.ID) -> EventLoopFuture<Event?>

    func fetchEvents(forCompetition competitionID: Competition.ID) -> EventLoopFuture<[Event]>

    func fetchEvents(forEventType eventTypeID: EventType.ID, isInPlay: Bool?) -> EventLoopFuture<[Event]>

}

public extension EventService {

    func fetchEvents(forEventType eventTypeID: EventType.ID) -> EventLoopFuture<[Event]> {
        fetchEvents(forEventType: eventTypeID, isInPlay: nil)
    }

}
