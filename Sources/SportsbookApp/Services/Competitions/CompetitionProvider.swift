import Foundation

protocol CompetitionProvider {

    func find(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel?

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel?

    func all(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]?

}
