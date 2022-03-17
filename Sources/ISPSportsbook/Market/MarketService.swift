import Foundation
import Logging
import SCAN
import Sportsbook

struct MarketService: MarketProvider {

    private let scan: SCANProvider
    private let logger: Logger

    init(scan: SCANProvider, logger: Logger) {
        self.scan = scan
        self.logger = logger
    }

    func find(withID id: Market.ID, locale: Locale) async throws -> Market? {
        logger.debug("Fetching Market", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.markets(withID: id, locale: locale))
        guard let attachment = response.attachments.sportsBookMarkets?.first else {
            return nil
        }

        let market = Market(id: attachment.key, attachment: attachment.value)
        return market
    }

    func all(forEvent eventID: Int, withMarketType marketType: String?, locale: Locale) async throws -> [Market] {
        logger.debug("Fetching Markets", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.markets(forEvent: eventID, locale: locale))
        guard let attachments = response.attachments.sportsBookMarkets else {
            return []
        }

        let markets = attachments
            .compactMap { (id: String, attachment: MarketAttachment) -> Market? in
                let market = Market(id: id, attachment: attachment)
                guard let marketType = marketType else {
                    return market
                }

                return attachment.marketType == marketType ? market : nil
            }
            .sorted { $0.name < $1.name }
            .sorted { $0.marketDate < $1.marketDate }
        return markets
    }

    func all(forEvents eventIDs: [Int], locale: Locale) async throws -> [Event.ID: [Market]] {
        logger.debug("Fetching Markets", metadata: ["event-ids": .stringConvertible(eventIDs)])

        let response = try await scan.search(.markets(forEvents: eventIDs, locale: locale))
        guard let attachments = response.attachments.sportsBookMarkets else {
            return [:]
        }

        var marketsDict = [Event.ID: [Market]]()
        attachments.forEach { attachment in
            guard let market = Market(id: attachment.key, attachment: attachment.value) else {
                return
            }

            var markets = marketsDict[market.eventID] ?? []
            markets.append(market)
            marketsDict[market.eventID] = markets
                .sorted { $0.name < $1.name }
                .sorted { $0.marketDate < $1.marketDate }
        }

        return marketsDict
    }

}
