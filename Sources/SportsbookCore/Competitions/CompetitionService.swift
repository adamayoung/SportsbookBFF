import Foundation

public protocol CompetitionService {

    func competition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel?

    func competitions(forSport sportID: SportDomainModel.ID) async throws -> [CompetitionDomainModel]

    func competition(forEvent eventID: EventDomainModel.ID) async throws -> CompetitionDomainModel?

}
