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

    func competitions(forEventType eventTypeID: Int) async throws -> [CompetitionDomainModel] {
        competitions.filter { $0.eventTypeID == eventTypeID }
    }

}
