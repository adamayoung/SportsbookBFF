import Foundation
@testable import SportsbookApp

struct MockSportService: SportProvider {

    let sports: [SportDomainModel]

    init(sports: [SportDomainModel] = SportDomainModel.mocks) {
        self.sports = sports
    }

    func all(locale: Locale) async throws -> [SportDomainModel] {
        sports
    }

    func popular(locale: Locale) async throws -> [SportDomainModel] {
        sports
    }

    func find(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        sports.first { $0.id == id }
    }

    func find(forCompetition competitionID: CompetitionDomainModel.ID,
               locale: Locale) async throws -> SportDomainModel? {
        sports.first
    }

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        sports.first
    }

}
