import Foundation
import Logging
import SCAN
import Sportsbook

struct ISPMarketService: MarketService {

    private let scan: SCANService
    private let logger: Logger

    init(scan: SCANService, logger: Logger) {
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

    func primary(forEvent eventID: Event.ID, locale: Locale) async throws -> Market? {
        logger.debug("Fetching Sport for Event", metadata: ["event-id": .stringConvertible(eventID)])

        let sportResponse = try await scan.search(.eventTypes(forEvent: eventID, locale: locale))
        guard let sportID = sportResponse.attachments.eventTypes?.first?.value.eventTypeID else {
            return nil
        }

        return nil
    }

    func all(forEvent eventID: Int, locale: Locale) async throws -> [Market] {
        logger.debug("Fetching Markets", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.markets(forEvent: eventID, locale: locale))
        guard let attachments = response.attachments.sportsBookMarkets else {
            return []
        }

        let markets = attachments
            .compactMap(Market.init)
            .sorted { $0.name.localizedLowercase < $1.name.localizedLowercase }
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

            var markets = marketsDict[market.eventID, default: []]
            markets.append(market)
            marketsDict[market.eventID] = markets
        }

        marketsDict.keys.forEach { eventID in
            marketsDict[eventID] = marketsDict[eventID, default: []]
                .sorted { $0.name.localizedLowercase < $1.name.localizedLowercase }
                .sorted { $0.marketDate < $1.marketDate }
        }

        return marketsDict
    }

}
