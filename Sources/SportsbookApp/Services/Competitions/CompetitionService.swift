import Foundation
import Logging
import SCAN

struct CompetitionService: CompetitionProvider {

    private let scan: SCANProvider
    private let logger: Logger

    init(scan: SCANProvider, logger: Logger) {
        self.scan = scan
        self.logger = logger
    }

    func find(withID id: Competition.ID, locale: Locale) async throws -> Competition? {
        logger.debug("Fetching Competition", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.competition(withID: id, locale: locale))
        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = Competition(attachment: attachment)
        return competition
    }

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Competition? {
        logger.debug("Fetching Competition", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.competitions(forEvent: eventID, locale: locale))
        guard response.attachments.events?.first?.value.eventID == eventID else {
            return nil
        }

        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = Competition(attachment: attachment)
        return competition
    }

    func all(forSport sportID: Sport.ID, locale: Locale) async throws -> [Competition]? {
        logger.debug("Fetching Competitions", metadata: ["sport-id": .stringConvertible(sportID)])

        let response = try await scan.search(.competitions(forEventType: sportID, locale: locale))
        guard response.attachments.eventTypes?.first?.value.eventTypeID == sportID else {
            return nil
        }

        guard let attachments = response.attachments.competitions?.values else {
            return []
        }

        let competitions = attachments
            .compactMap(Competition.init)
        return competitions
    }

}
