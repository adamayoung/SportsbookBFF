import Foundation
import GBP
import Logging
import NIO

final class CompetitionSCANService: CompetitionService {

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

    func fetchCompetition(withID id: Competition.ID) -> EventLoopFuture<Competition?> {
        logger.debug("Fetching Competition", metadata: ["id": .stringConvertible(id)])

        return scanService.search(searchRequest: .competition(withID: id, locale: locale))
            .map { $0.attachments.competitions?.first?.value }
            .optionalMap(Competition.init)
    }

    func fetchCompetitions(forEventType eventTypeID: EventType.ID) -> EventLoopFuture<[Competition]> {
        logger.debug("Fetching Competitions", metadata: ["event-type-id": .stringConvertible(eventTypeID)])

        return scanService.search(searchRequest: .competitions(forEventType: eventTypeID, locale: locale))
            .map { $0.attachments.competitions?.values }
            .optionalMap { $0.compactMap(Competition.init) }
            .unwrap(orReplace: [])
            .map { $0.sorted() }
    }

}
