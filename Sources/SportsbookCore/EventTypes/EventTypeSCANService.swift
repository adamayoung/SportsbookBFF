import Foundation
import Logging
import SCAN

struct EventTypeSCANService: EventTypeService {

    private let scanService: SCANService
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, locale: Locale, logger: Logger) {
        self.scanService = scanService
        self.locale = locale
        self.logger = logger
    }

    func fetchEventType(withID id: EventTypeDomainModel.ID) async throws -> EventTypeDomainModel? {
        logger.debug("Fetching Event Type", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.eventType(withID: id, locale: locale)
        let response = try await scanService.search(request: request)
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return EventTypeDomainModel(attachment: attachment)
    }

    func fetchEventTypes(filter: EventTypesFilterConvertible?) async throws -> [EventTypeDomainModel] {
        logger.debug("Fetching Event Types")

        let request = SearchRequest.allEventTypes(locale: locale)
        let response = try await scanService.search(request: request)
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        return attachments
            .compactMap(EventTypeDomainModel.init)
            .filter(filter?.eventTypesFilter)
            .sorted()
    }

}
