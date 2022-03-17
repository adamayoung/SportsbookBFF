import Foundation
import Sportsbook

struct MockCompetitionService: CompetitionProvider {

    let competitions: [Competition]

    init(competitions: [Competition]) {
        self.competitions = competitions
    }

    func find(withID id: Competition.ID, locale: Locale) async throws -> Competition? {
        competitions.first { $0.id == id }
    }

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Competition? {
        competitions.first
    }

    func all(forSport sportID: Sport.ID, locale: Locale) async throws -> [Competition]? {
        let competitions = competitions.filter { $0.sportID == sportID }
        guard !competitions.isEmpty else {
            return nil
        }

        return competitions
    }

}
