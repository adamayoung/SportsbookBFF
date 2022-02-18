import Foundation
import SportsbookCore

struct MockEventService: EventService {

    let events: [EventDomainModel]

    init(events: [EventDomainModel]) {
        self.events = events
    }

    func event(withID id: EventDomainModel.ID) async throws -> EventDomainModel? {
        events.first { $0.id == id }
    }

    func events(forCompetition competitionID: Int) async throws -> [EventDomainModel] {
        events.filter { $0.competitionID == competitionID }
    }

    func events(forSport sportID: Int, isInPlay: Bool?) async throws -> [EventDomainModel] {
        events
            .filter { $0.sportID == sportID }
            .filter {
                guard let isInPlay = isInPlay else {
                    return true
                }

                return $0.isInPlay == isInPlay
            }
    }

}
