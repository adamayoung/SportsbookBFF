import Foundation
import Sportsbook

struct MockSportService: SportProvider {

    let sports: [Sport]

    init(sports: [Sport] = Sport.mocks) {
        self.sports = sports
    }

    func all(locale: Locale) async throws -> [Sport] {
        sports
    }

    func popular(locale: Locale) async throws -> [Sport] {
        sports
    }

    func find(withID id: Sport.ID, locale: Locale) async throws -> Sport? {
        sports.first { $0.id == id }
    }

    func find(forCompetition competitionID: Competition.ID,
              locale: Locale) async throws -> Sport? {
        sports.first
    }

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Sport? {
        sports.first
    }

}
