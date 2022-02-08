import Foundation
import Logging
import SCAN

final class MarketSCANService: MarketService {

    private let scanService: SCANService
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, locale: Locale = .default, logger: Logger) {
        self.scanService = scanService
        self.locale = locale
        self.logger = logger
    }

    func market(withID id: MarketDomainModel.ID) async throws -> MarketDomainModel? {
        logger.debug("Fetching Market", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.market(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.sportsBookMarkets?.first else {
            return nil
        }

        return MarketDomainModel(id: attachment.key, attachment: attachment.value)
    }

    func markets(forEvent eventID: Int) async throws -> [MarketDomainModel] {
        logger.debug("Fetching Markets", metadata: ["event-id": .stringConvertible(eventID)])

        let request = SearchRequest.markets(forEvent: eventID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.sportsBookMarkets else {
            return []
        }

        return attachments
            .map(MarketDomainModel.init)
            .sorted { $0.name < $1.name }
            .sorted { $0.marketDate < $1.marketDate }
    }

}
