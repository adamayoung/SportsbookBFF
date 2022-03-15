import Foundation
@testable import SportsbookApp

struct MockCompetitionService: CompetitionProvider {

    let competitions: [CompetitionDomainModel]

    init(competitions: [CompetitionDomainModel]) {
        self.competitions = competitions
    }

    func find(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        competitions.first { $0.id == id }
    }

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        competitions.first
    }

    func all(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]? {
        let competitions = competitions.filter { $0.sportID == sportID }
        guard !competitions.isEmpty else {
            return nil
        }

        return competitions
    }

}
