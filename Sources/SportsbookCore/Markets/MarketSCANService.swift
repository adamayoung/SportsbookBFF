import Foundation
import Logging
import SCAN

final class MarketSCANService: MarketService {

    private let scanService: SCANService
    private let logger: Logger

    init(scanService: SCANService, logger: Logger) {
        self.scanService = scanService
        self.logger = logger
    }

    func market(withID id: MarketDomainModel.ID, locale: Locale) async throws -> MarketDomainModel? {
        logger.debug("Fetching Market", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.markets(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.sportsBookMarkets?.first else {
            return nil
        }

        let market = MarketDomainModel(id: attachment.key, attachment: attachment.value)
        return market
    }

    func markets(forEvent eventID: Int, locale: Locale) async throws -> [MarketDomainModel] {
        logger.debug("Fetching Markets", metadata: ["event-id": .stringConvertible(eventID)])

        let request = SearchRequest.markets(forEvent: eventID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.sportsBookMarkets else {
            return []
        }

        let markets = attachments
            .compactMap(MarketDomainModel.init)
            .sorted { $0.name < $1.name }
            .sorted { $0.marketDate < $1.marketDate }
        return markets
    }

}
