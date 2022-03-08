import Foundation
import SportsbookCore

struct MockCompetitionService: CompetitionService {

    let competitions: [CompetitionDomainModel]

    init(competitions: [CompetitionDomainModel]) {
        self.competitions = competitions
    }

    func competition(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        competitions.first { $0.id == id }
    }

    func competitions(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]? {
        let competitions = competitions.filter { $0.sportID == sportID }
        guard !competitions.isEmpty else {
            return nil
        }

        return competitions
    }

    func competition(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        competitions.first
    }

}
