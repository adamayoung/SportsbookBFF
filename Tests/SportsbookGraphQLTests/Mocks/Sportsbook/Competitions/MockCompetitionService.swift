import Foundation
import SportsbookCore

struct MockCompetitionService: CompetitionService {

    let competitions: [CompetitionDomainModel]

    init(competitions: [CompetitionDomainModel]) {
        self.competitions = competitions
    }

    func competition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel? {
        competitions.first { $0.id == id }
    }

    func competitions(forSport sportID: Int) async throws -> [CompetitionDomainModel] {
        competitions.filter { $0.sportID == sportID }
    }

    func competition(forEvent eventID: EventDomainModel.ID) async throws -> CompetitionDomainModel? {
        competitions.first
    }

}
