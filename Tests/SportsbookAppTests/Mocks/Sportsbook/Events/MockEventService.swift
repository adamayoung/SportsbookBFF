import Foundation
import Sportsbook

struct MockEventService: EventService {

    let events: [EventDomainModel]

    init(events: [EventDomainModel]) {
        self.events = events
    }

    func fetchEvent(withID id: EventDomainModel.ID) async throws -> EventDomainModel? {
        events.first { $0.id == id }
    }

    func fetchEvents(forCompetition competitionID: Int) async throws -> [EventDomainModel] {
        events.filter { $0.competitionID == competitionID }
    }

    func fetchEvents(forEventType eventTypeID: Int, isInPlay: Bool?) async throws -> [EventDomainModel] {
        events
            .filter { $0.eventTypeID == eventTypeID }
            .filter {
                guard let isInPlay = isInPlay else {
                    return true
                }

                return $0.isInPlay == isInPlay
            }
    }

}
