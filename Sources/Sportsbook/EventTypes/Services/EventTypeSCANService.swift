import Foundation
import GBP
import Logging
import NIO

struct EventTypeSCANService: EventTypeService {

    private let scanService: SCANService
    private let eventLoop: EventLoop
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, eventLoop: EventLoop, locale: Locale, logger: Logger) {
        self.scanService = scanService
        self.eventLoop = eventLoop
        self.locale = locale
        self.logger = logger
    }

    func fetchEventType(withID id: EventTypeDomainModel.ID) -> EventLoopFuture<EventTypeDomainModel?> {
        logger.debug("Fetching Event Type", metadata: ["id": .stringConvertible(id)])

        return scanService.search(searchRequest: .eventType(withID: id, locale: locale))
            .map { $0.attachments.eventTypes?.first?.value }
            .optionalMap(EventTypeDomainModel.init)
    }

    func fetchEventTypes(filter: EventTypesFilterConvertible?) -> EventLoopFuture<[EventTypeDomainModel]> {
        logger.debug("Fetching Event Types")

        return scanService.search(searchRequest: .allEventTypes(locale: locale))
            .map { $0.attachments.eventTypes?.values }
            .optionalMap { $0.compactMap(EventTypeDomainModel.init) }
            .unwrap(orReplace: [])
            .filter(with: filter?.eventTypesFilter)
            .map { $0.sorted() }
    }

}
