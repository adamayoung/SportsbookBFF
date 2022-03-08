import Foundation
import Logging
import SCAN
import SportsCMS

struct SportSCANService: SportService {

    private let scanService: SCANService
    private let cmsNodeService: NodeService
    private let logger: Logger

    init(scanService: SCANService, cmsNodeService: NodeService, logger: Logger) {
        self.scanService = scanService
        self.cmsNodeService = cmsNodeService
        self.logger = logger
    }

    func sports(locale: Locale) async throws -> [SportDomainModel] {
        logger.debug("Fetching Sports")

        let request = SearchRequest.eventTypes(locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        return attachments
            .compactMap(SportDomainModel.init)
            .sorted()
    }

    func popularSports(locale: Locale) async throws -> [SportDomainModel] {
        logger.debug("Fetching popular Sports")

        let sportIDs = try await cmsNodeService.fetchNodes(withTag: .popular, ofType: .sport)
            .compactMap { node -> Int? in
                guard let id = node.sportID else {
                    return nil
                }

                return Int(id)
            }

        let request = SearchRequest.eventTypes(withIDs: sportIDs, locale: locale)
        let response = try await scanService.search(request)
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        let sports = sportIDs
            .compactMap { id in
                attachments.first { $0.eventTypeID == id }
            }
            .compactMap(SportDomainModel.init)

        return sports
    }

    func sport(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["id": .stringConvertible(id)])

        let request = SearchRequest.eventTypes(withID: id, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

    func sport(forCompetition competitionID: CompetitionDomainModel.ID,
               locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["competition-id": .stringConvertible(competitionID)])

        let request = SearchRequest.eventTypes(forCompetition: competitionID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

    func sport(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["event-id": .stringConvertible(eventID)])

        let request = SearchRequest.eventTypes(forEvent: eventID, locale: locale)
        let response = try await scanService.search(request)
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

}
