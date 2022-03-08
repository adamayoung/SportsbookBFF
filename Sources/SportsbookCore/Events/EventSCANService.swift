import Foundation
import Logging
import SCAN

final class EventSCANService: EventService {

    private let scanService: SCANService
    private let logger: Logger

    init(scanService: SCANService, logger: Logger) {
        self.scanService = scanService
        self.logger = logger
    }

    func event(withID id: EventDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        logger.debug("Fetching Event", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.event(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = EventDomainModel(attachment: attachment, facets: response.facets)
        return event
    }

    func events(forCompetition competitionID: CompetitionDomainModel.ID,
                locale: Locale) async throws -> [EventDomainModel] {
        logger.debug("Fetching Events", metadata: ["competition-id": .stringConvertible(competitionID)])

        let request = SearchRequest.events(forCompetition: competitionID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        let events = attachments
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted()
        return events
    }

    func events(forSport sportID: SportDomainModel.ID, isInPlay: Bool? = nil,
                locale: Locale) async throws -> [EventDomainModel] {
        var metadata: Logger.Metadata = [
            "sport-id": .stringConvertible(sportID)
        ]
        if let isInPlay = isInPlay {
            metadata["is-in-play"] = .stringConvertible(isInPlay)
        }

        logger.debug("Fetching Events", metadata: metadata)

        let request = SearchRequest.events(forEventType: sportID, isInPlay: isInPlay, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        let events = attachments
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted()
        return events
    }

    func event(forMarket marketID: MarketDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        logger.debug("Fetching Event", metadata: ["market-id": .stringConvertible(marketID)])

        let request = SearchRequest.events(forMarket: marketID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = EventDomainModel(attachment: attachment, facets: response.facets)
        return event
    }

}
