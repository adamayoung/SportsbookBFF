import Foundation
import Sportsbook

struct MockEventService: EventService {

    let events: [Event]

    init(events: [Event]) {
        self.events = events
    }

    func find(withID id: Event.ID, locale: Locale) async throws -> Event? {
        events.first { $0.id == id }
    }

    func all(forCompetition competitionID: Int, locale: Locale) async throws -> [Event] {
        events.filter { $0.competitionID == competitionID }
    }

    func all(forSport sportID: Int, isInPlay: Bool?, locale: Locale) async throws -> [Event] {
        events
            .filter { $0.sportID == sportID }
            .filter {
                guard let isInPlay = isInPlay else {
                    return true
                }

                return $0.isInPlay == isInPlay
            }
    }

    func all(forSports sportIDs: [Sport.ID], isInPlay: Bool?, locale: Locale) async throws -> [Sport.ID: [Event]] {
        return [:]
    }

    func find(forMarket marketID: Market.ID, locale: Locale) async throws -> Event? {
        events.first
    }

}
