import Foundation
import NIO

public protocol EventService {

    func fetchEvent(withID id: EventDomainModel.ID) -> EventLoopFuture<EventDomainModel?>

    func fetchEvents(forCompetition competitionID: CompetitionDomainModel.ID) -> EventLoopFuture<[EventDomainModel]>

    func fetchEvents(forEventType eventTypeID: EventTypeDomainModel.ID,
                     isInPlay: Bool?) -> EventLoopFuture<[EventDomainModel]>

}

public extension EventService {

    func fetchEvents(forEventType eventTypeID: EventTypeDomainModel.ID) -> EventLoopFuture<[EventDomainModel]> {
        fetchEvents(forEventType: eventTypeID, isInPlay: nil)
    }

}
