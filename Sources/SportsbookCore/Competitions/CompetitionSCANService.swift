import Foundation
import Logging
import SCAN

final class CompetitionSCANService: CompetitionService {

    private let scanService: SCANService
    private let logger: Logger

    init(scanService: SCANService, logger: Logger) {
        self.scanService = scanService
        self.logger = logger
    }

    func competition(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        logger.debug("Fetching Competition", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.competition(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = CompetitionDomainModel(attachment: attachment)
        return competition
    }

    func competitions(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]? {
        logger.debug("Fetching Competitions", metadata: ["sport-id": .stringConvertible(sportID)])

        let request = SearchRequest.competitions(forEventType: sportID, locale: locale)
        let response = try await scanService.search(request)
        guard response.attachments.eventTypes?.first?.value.eventTypeID == sportID else {
            return nil
        }

        guard let attachments = response.attachments.competitions?.values else {
            return []
        }

        let competitions = attachments
            .compactMap(CompetitionDomainModel.init)
        return competitions
    }

    func competition(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        logger.debug("Fetching Competition", metadata: ["event-id": .stringConvertible(eventID)])

        let request = SearchRequest.competitions(forEvent: eventID, locale: locale)
        let response = try await scanService.search(request)
        guard response.attachments.events?.first?.value.eventID == eventID else {
            return nil
        }

        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = CompetitionDomainModel(attachment: attachment)
        return competition
    }

}
