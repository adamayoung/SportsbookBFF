import Foundation
import Logging
import SCAN
import Sportsbook

struct EventService: EventProvider {

    private let scan: SCANProvider
    private let logger: Logger

    init(scan: SCANProvider, logger: Logger) {
        self.scan = scan
        self.logger = logger
    }

    func find(withID id: Event.ID, locale: Locale) async throws -> Event? {
        logger.debug("Fetching Event", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.event(withID: id, locale: locale))
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = Event(attachment: attachment, facets: response.facets)
        return event
    }

    func find(forMarket marketID: Market.ID, locale: Locale) async throws -> Event? {
        logger.debug("Fetching Event", metadata: ["market-id": .stringConvertible(marketID)])

        let response = try await scan.search(.events(forMarket: marketID, locale: locale))
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = Event(attachment: attachment, facets: response.facets)
        return event
    }

    func all(forCompetition competitionID: Competition.ID,
             locale: Locale) async throws -> [Event] {
        logger.debug("Fetching Events", metadata: ["competition-id": .stringConvertible(competitionID)])

        let response = try await scan.search(.events(forCompetition: competitionID, locale: locale))
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        let events = attachments
            .compactMap { Event(attachment: $0, facets: response.facets) }
            .sorted { $0.name < $1.name }
            .sorted { $0.openDate ?? Date() < $1.openDate ?? Date() }
        return events
    }

    func all(forSport sportID: Sport.ID, isInPlay: Bool? = nil,
             locale: Locale) async throws -> [Event] {
        var metadata: Logger.Metadata = [
            "sport-id": .stringConvertible(sportID)
        ]
        if let isInPlay = isInPlay {
            metadata["is-in-play"] = .stringConvertible(isInPlay)
        }

        logger.debug("Fetching Events", metadata: metadata)

        let response = try await scan.search(.events(forEventType: sportID, isInPlay: isInPlay, locale: locale))
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        let events = attachments
            .compactMap { Event(attachment: $0, facets: response.facets) }
            .sorted { $0.name < $1.name }
            .sorted { $0.openDate ?? Date() < $1.openDate ?? Date() }
        return events
    }

    func all(forSports sportIDs: [Sport.ID], isInPlay: Bool? = nil,
             locale: Locale) async throws -> [Sport.ID: [Event]] {
        var metadata: Logger.Metadata = [
            "sport-ids": .stringConvertible(sportIDs)
        ]
        if let isInPlay = isInPlay {
            metadata["is-in-play"] = .stringConvertible(isInPlay)
        }

        logger.debug("Fetching Events", metadata: metadata)

        let response = try await scan.search(.events(forEventTypes: sportIDs, isInPlay: isInPlay, locale: locale))
        guard let attachments = response.attachments.events?.values else {
            return [:]
        }

        var eventsDict = [Sport.ID: [Event]]()

        attachments.forEach { attachment in
            guard let event = Event(attachment: attachment, facets: response.facets) else {
                return
            }

            var events = eventsDict[attachment.eventTypeID] ?? []
            events.append(event)
            eventsDict[attachment.eventTypeID] = events
        }

        eventsDict.keys.forEach { sportID in
            eventsDict[sportID] = eventsDict[sportID]?
                .sorted { $0.name < $1.name }
                .sorted { $0.openDate ?? Date() < $1.openDate ?? Date() }
        }

        return eventsDict
    }

}
