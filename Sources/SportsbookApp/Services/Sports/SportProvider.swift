import Foundation

protocol SportProvider {

    func all(locale: Locale) async throws -> [SportDomainModel]

    func popular(locale: Locale) async throws -> [SportDomainModel]

    func find(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel?

    func find(forCompetition competitionID: CompetitionDomainModel.ID, locale: Locale) async throws -> SportDomainModel?

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel?

}
