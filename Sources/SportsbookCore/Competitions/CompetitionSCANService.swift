import Foundation
import Logging
import SCAN

final class CompetitionSCANService: CompetitionService {

    private let scanService: SCANService
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, locale: Locale, logger: Logger) {
        self.scanService = scanService
        self.locale = locale
        self.logger = logger
    }

    func competition(withID id: CompetitionDomainModel.ID) async throws -> CompetitionDomainModel? {
        logger.debug("Fetching Competition", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.competition(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        return CompetitionDomainModel(attachment: attachment)
    }

    func competitions(forEventType eventTypeID: EventTypeDomainModel.ID) async throws -> [CompetitionDomainModel] {
        logger.debug("Fetching Competitions", metadata: ["event-type-id": .stringConvertible(eventTypeID)])

        let request = SearchRequest.competitions(forEventType: eventTypeID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.competitions?.values else {
            return []
        }

        return attachments
            .compactMap(CompetitionDomainModel.init)
            .sorted()
    }

}
