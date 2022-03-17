import Foundation

public protocol CompetitionService {

    func find(withID id: Competition.ID, locale: Locale) async throws -> Competition?

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Competition?

    func all(forSport sportID: Sport.ID, locale: Locale) async throws -> [Competition]?

}
