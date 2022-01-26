import Foundation

public protocol CompetitionService {

    func fetchCompetition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel?

    func fetchCompetitions(forEventType eventTypeID: EventTypeDomainModel.ID) async throws -> [CompetitionDomainModel]

}
