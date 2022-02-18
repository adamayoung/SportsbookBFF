import Foundation
import Logging
import SCAN

struct SportSCANService: SportService {

    private let scanService: SCANService
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, locale: Locale, logger: Logger) {
        self.scanService = scanService
        self.locale = locale
        self.logger = logger
    }

    func sport(withID id: SportDomainModel.ID) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.eventType(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

    func sports(filter: SportsFilterConvertible?) async throws -> [SportDomainModel] {
        logger.debug("Fetching Sports")

        let request = SearchRequest.allEventTypes(locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        return attachments
            .compactMap(SportDomainModel.init)
            .filter(filter?.sportsFilter)
            .sorted()
    }

}
