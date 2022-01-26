import Foundation
import GBP
import Logging

final class EventSCANService: EventService {

    private let scanService: SCANService
    private let locale: Locale
    private let logger: Logger

    init(scanService: SCANService, locale: Locale, logger: Logger) {
        self.scanService = scanService
        self.locale = locale
        self.logger = logger
    }

    func fetchEvent(withID id: EventDomainModel.ID) async throws -> EventDomainModel? {
        logger.debug("Fetching Event", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.event(withID: id, locale: locale)
        let response = try await scanService.search(request: request)
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        return EventDomainModel(attachment: attachment, facets: response.facets)
    }

    func fetchEvents(forCompetition competitionID: CompetitionDomainModel.ID) async throws -> [EventDomainModel] {
        logger.debug("Fetching Events", metadata: ["competition-id": .stringConvertible(competitionID)])

        let request = SearchRequest.events(forCompetition: competitionID, locale: locale)
        let response = try await scanService.search(request: request)
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        return attachments
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted()
    }

    func fetchEvents(forEventType eventTypeID: EventTypeDomainModel.ID,
                     isInPlay: Bool? = nil) async throws -> [EventDomainModel] {
        var metadata: Logger.Metadata = [
            "event-type-id": .stringConvertible(eventTypeID)
        ]
        if let isInPlay = isInPlay {
            metadata["is-in-play"] = .stringConvertible(isInPlay)
        }

        logger.debug("Fetching Events", metadata: metadata)

        let request = SearchRequest.events(forEventType: eventTypeID, isInPlay: isInPlay, locale: locale)
        let response = try await scanService.search(request: request)
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        return attachments
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted()
    }

}
