import Foundation
@testable import SportsbookApp

struct MockEventService: EventProvider {

    let events: [EventDomainModel]

    init(events: [EventDomainModel]) {
        self.events = events
    }

    func find(withID id: EventDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        events.first { $0.id == id }
    }

    func all(forCompetition competitionID: Int, locale: Locale) async throws -> [EventDomainModel] {
        events.filter { $0.competitionID == competitionID }
    }

    func all(forSport sportID: Int, isInPlay: Bool?, locale: Locale) async throws -> [EventDomainModel] {
        events
            .filter { $0.sportID == sportID }
            .filter {
                guard let isInPlay = isInPlay else {
                    return true
                }

                return $0.isInPlay == isInPlay
            }
    }

    func all(forSports sportIDs: [SportDomainModel.ID], isInPlay: Bool?, locale: Locale) async throws -> [SportDomainModel.ID : [EventDomainModel]] {
        return [:]
    }

    func find(forMarket marketID: MarketDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        events.first
    }

}
