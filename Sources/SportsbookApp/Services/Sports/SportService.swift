import Logging
import SCAN
import SportsCMS
import Vapor

struct SportService: SportProvider {

    private let scan: SCANProvider
    private let cms: SportsCMSProvider
    private let logger: Logger

    init(scan: SCANProvider, cms: SportsCMSProvider, logger: Logger) {
        self.scan = scan
        self.cms = cms
        self.logger = logger
    }

    func all(locale: Locale) async throws -> [SportDomainModel] {
        logger.debug("Fetching Sports")

        let response = try await scan.search(.eventTypes(locale: locale))
        guard let attachments = response.attachments.eventTypes?.values else {
            return []
        }

        return attachments
            .compactMap(SportDomainModel.init)
            .sorted()
    }

    func popular(locale: Locale) async throws -> [SportDomainModel] {
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
            .compactMap(SportDomainModel.init)

        return sports
    }

    func find(withID id: SportDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.eventTypes(withID: id, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

    func find(forCompetition competitionID: CompetitionDomainModel.ID,
               locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["competition-id": .stringConvertible(competitionID)])

        let response = try await scan.search(.eventTypes(forCompetition: competitionID, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> SportDomainModel? {
        logger.debug("Fetching Sport", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.eventTypes(forEvent: eventID, locale: locale))
        guard let attachment = response.attachments.eventTypes?.first?.value else {
            return nil
        }

        return SportDomainModel(attachment: attachment)
    }

}

extension Request {

    var sports: SportProvider {
        self.application.sportsFactory.make!(self)
    }

}
