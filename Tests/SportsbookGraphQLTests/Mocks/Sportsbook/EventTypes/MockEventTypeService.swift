import Foundation
import SportsbookCore

struct MockSportService: SportService {

    let sports: [SportDomainModel]

    init(sports: [SportDomainModel] = SportDomainModel.mocks) {
        self.sports = sports
    }

    func sport(withID id: SportDomainModel.ID) async throws -> SportDomainModel? {
        sports.first { $0.id == id }
    }

    func sports(filter: SportsFilterConvertible?) async throws -> [SportDomainModel] {
        sports
    }

    func sport(forCompetition competitionID: CompetitionDomainModel.ID) async throws -> SportDomainModel? {
        sports.first
    }

    func sport(forEvent eventID: EventDomainModel.ID) async throws -> SportDomainModel? {
        sports.first
    }

}
