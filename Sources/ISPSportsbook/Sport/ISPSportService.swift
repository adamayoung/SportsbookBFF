import Foundation
import Logging
import SCAN
import Sportsbook
import SportsCMS

struct ISPSportService: SportService {

    private let scan: SCANService
    private let cms: SportsCMSService
    private let logger: Logger

    init(scan: SCANService, cms: SportsCMSService, logger: Logger) {
        self.scan = scan
        self.cms = cms
        self.logger = logger
    }

    func all(locale: Locale) async throws -> [Sport] {
        logger.debug("Fetching Sports")

        let response = try await scan.search(.eventTypes(locale: locale))
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        return attachments
            .compactMap(Sport.init)
            .sorted()
    }

    func popular(locale: Locale) async throws -> [Sport] {
        logger.debug("Fetching popular Sports")

        let sportIDs = try await cms.nodes(withTag: .popular, ofType: .sport)
            .compactMap { node -> Int? in
                guard let id = node.sportID else {
                    return nil
                }

                return Int(id)
            }

        guard !sportIDs.isEmpty else {
            return []
        }

        let response = try await scan.search(.eventTypes(withIDs: sportIDs, locale: locale))
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        let sports = sportIDs
            .compactMap { id in
                attachments.first { $0.eventTypeID == id }
            }
            .compactMap(Sport.init)

        return sports
    }

    func find(withID id: Sport.ID, locale: Locale) async throws -> Sport? {
        logger.debug("Fetching Sport", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.eventTypes(withID: id, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return Sport(attachment: attachment)
    }

    func find(forCompetition competitionID: Competition.ID,
              locale: Locale) async throws -> Sport? {
        logger.debug("Fetching Sport", metadata: ["competition-id": .stringConvertible(competitionID)])

        let response = try await scan.search(.eventTypes(forCompetition: competitionID, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return Sport(attachment: attachment)
    }

    func find(forEvent eventID: Event.ID, locale: Locale) async throws -> Sport? {
        logger.debug("Fetching Sport", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.eventTypes(forEvent: eventID, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return Sport(attachment: attachment)
    }

}
