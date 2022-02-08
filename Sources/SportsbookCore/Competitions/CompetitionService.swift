import Foundation

public protocol CompetitionService {

    func competition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel?

    func competitions(forEventType eventTypeID: EventTypeDomainModel.ID) async throws -> [CompetitionDomainModel]

}
