import Foundation
import GBP
import Logging
import NIO

final class EventSCANService: EventService {

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

    func fetchEvent(withID id: Event.ID) -> EventLoopFuture<Event?> {
        logger.debug("Fetching Event", metadata: ["id": .stringConvertible(id)])

        return scanService.search(searchRequest: .event(withID: id, locale: locale))
            .map { searchResult in
                guard let eventAttachment = searchResult.attachments.events?.first?.value else {
                    return nil
                }

                return (attachment: eventAttachment, facets: searchResult.facets)
            }
            .optionalMap(Event.init(attachment:facets:))
    }

    func fetchEvents(forCompetition competitionID: Competition.ID) -> EventLoopFuture<[Event]> {
        logger.debug("Fetching Events", metadata: ["competition-id": .stringConvertible(competitionID)])

        return scanService.search(searchRequest: .events(forCompetition: competitionID, locale: locale))
            .map { searchResult -> [Event] in
                guard let eventAttachments = searchResult.attachments.events?.values else {
                    return []
                }

                return eventAttachments.compactMap {
                    Event(attachment: $0, facets: searchResult.facets)
                }
            }
            .map { $0.sorted() }
    }

    func fetchEvents(forEventType eventTypeID: EventType.ID, isInPlay: Bool? = nil) -> EventLoopFuture<[Event]> {
        var metadata: Logger.Metadata = [
            "event-type-id": .stringConvertible(eventTypeID)
        ]
        if let isInPlay = isInPlay {
            metadata["is-in-play"] = .stringConvertible(isInPlay)
        }

        logger.debug("Fetching Events", metadata: metadata)

        return scanService.search(searchRequest: .events(forEventType: eventTypeID, isInPlay: isInPlay, locale: locale))
            .map { searchResult -> [Event] in
                guard let eventAttachments = searchResult.attachments.events?.values else {
                    return []
                }

                return eventAttachments.compactMap {
                    Event(attachment: $0, facets: searchResult.facets)
                }
            }
            .map { $0.sorted() }
    }

}
