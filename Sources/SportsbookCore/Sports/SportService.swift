import Foundation

public protocol SportService {

    func sports(locale: Locale) async throws -> [SportDomainModel]

    func popularSports(locale: Locale) async throws -> [SportDomainModel]

    func sport(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel?

    func sport(forCompetition competitionID: CompetitionDomainModel.ID,
               locale: Locale) async throws -> SportDomainModel?

    func sport(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel?

}
