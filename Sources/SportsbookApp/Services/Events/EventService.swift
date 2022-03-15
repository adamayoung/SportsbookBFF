import Logging
import SCAN
import Vapor

struct EventService: EventProvider {

    private let scan: SCANProvider
    private let logger: Logger

    init(scan: SCANProvider, logger: Logger) {
        self.scan = scan
        self.logger = logger
    }

    func find(withID id: EventDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        logger.debug("Fetching Event", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.event(withID: id, locale: locale))
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = EventDomainModel(attachment: attachment, facets: response.facets)
        return event
    }

    func find(forMarket marketID: MarketDomainModel.ID, locale: Locale) async throws -> EventDomainModel? {
        logger.debug("Fetching Event", metadata: ["market-id": .stringConvertible(marketID)])

        let response = try await scan.search(.events(forMarket: marketID, locale: locale))
        guard let attachment = response.attachments.events?.first?.value else {
            return nil
        }

        let event = EventDomainModel(attachment: attachment, facets: response.facets)
        return event
    }

    func all(forCompetition competitionID: CompetitionDomainModel.ID,
             locale: Locale) async throws -> [EventDomainModel] {
        logger.debug("Fetching Events", metadata: ["competition-id": .stringConvertible(competitionID)])

        let response = try await scan.search(.events(forCompetition: competitionID, locale: locale))
        guard let attachments = response.attachments.events?.values else {
            return []
        }

        let events = attachments
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted { $0.name < $1.name }
            .sorted { $0.openDate ?? Date() < $1.openDate ?? Date() }
        return events
    }

    func all(forSport sportID: SportDomainModel.ID, isInPlay: Bool? = nil,
             locale: Locale) async throws -> [EventDomainModel] {
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
            .compactMap { EventDomainModel(attachment: $0, facets: response.facets) }
            .sorted { $0.name < $1.name }
            .sorted { $0.openDate ?? Date() < $1.openDate ?? Date() }
        return events
    }

    func all(forSports sportIDs: [SportDomainModel.ID], isInPlay: Bool? = nil,
             locale: Locale) async throws -> [SportDomainModel.ID: [EventDomainModel]] {
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

        var eventsDict = [SportDomainModel.ID: [EventDomainModel]]()

        attachments.forEach { attachment in
            guard let event = EventDomainModel(attachment: attachment, facets: response.facets) else {
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

extension Request {

    var events: EventProvider {
        self.application.eventsFactory.make!(self)
    }

}
