import Foundation
import GBP
import Logging
import NIO

final class MarketSCANService: MarketService {

    private let scanService: SCANService
    private let eventLoop: EventLoop
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, eventLoop: EventLoop, locale: Locale = .default, logger: Logger) {
        self.scanService = scanService
        self.eventLoop = eventLoop
        self.locale = locale
        self.logger = logger
    }

    func fetchMarket(withID id: MarketDomainModel.ID) -> EventLoopFuture<MarketDomainModel?> {
        logger.debug("Fetching Market", metadata: ["id": .stringConvertible(id)])

        return scanService.search(searchRequest: .market(withID: id, locale: locale))
            .map { $0.attachments.sportsBookMarkets?.first }
            .optionalMap(MarketDomainModel.init)
    }

    func fetchMarkets(forEvent eventID: Int) -> EventLoopFuture<[MarketDomainModel]> {
        logger.debug("Fetching Markets", metadata: ["event-id": .stringConvertible(eventID)])

        return scanService.search(searchRequest: .markets(forEvent: eventID, locale: locale))
            .map { $0.attachments.sportsBookMarkets }
            .unwrap(orReplace: [:])
            .mapEach(MarketDomainModel.init)
            .map { $0.sorted { $0.name < $1.name } }
            .map { $0.sorted { $0.marketDate < $1.marketDate } }
    }

}
