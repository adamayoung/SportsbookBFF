import Foundation

public protocol SportService {

    func all(locale: Locale) async throws -> [Sport]

    func popular(locale: Locale) async throws -> [Sport]

    func find(withID id: Sport.ID, locale: Locale) async throws -> Sport?

    func find(forCompetition competitionID: Competition.ID, locale: Locale) async throws -> Sport?

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Sport?

}
