import Foundation
import Sportsbook

struct MockCompetitionService: CompetitionService {

    let competitions: [CompetitionDomainModel]

    init(competitions: [CompetitionDomainModel]) {
        self.competitions = competitions
    }

    func fetchCompetition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel? {
        competitions.first { $0.id == id }
    }

    func fetchCompetitions(forEventType eventTypeID: Int) async throws -> [CompetitionDomainModel] {
        competitions.filter { $0.eventTypeID == eventTypeID }
    }

}
