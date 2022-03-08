import Foundation

public protocol CompetitionService {

    func competition(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel?

    func competitions(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]?

    func competition(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel?

}
