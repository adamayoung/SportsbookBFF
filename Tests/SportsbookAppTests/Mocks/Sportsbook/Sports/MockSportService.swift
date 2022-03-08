import Foundation
import SportsbookCore

struct MockSportService: SportService {

    let sports: [SportDomainModel]

    init(sports: [SportDomainModel] = SportDomainModel.mocks) {
        self.sports = sports
    }

    func sports(locale: Locale) async throws -> [SportDomainModel] {
        sports
    }

    func popularSports(locale: Locale) async throws -> [SportDomainModel] {
        sports
    }

    func sport(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        sports.first { $0.id == id }
    }

    func sport(forCompetition competitionID: CompetitionDomainModel.ID,
               locale: Locale) async throws -> SportDomainModel? {
        sports.first
    }

    func sport(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        sports.first
    }

}
