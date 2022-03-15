import Logging
import SCAN
import Vapor

struct CompetitionService: CompetitionProvider {

    private let scan: SCANProvider
    private let logger: Logger

    init(scan: SCANProvider, logger: Logger) {
        self.scan = scan
        self.logger = logger
    }

    func find(withID id: CompetitionDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        logger.debug("Fetching Competition", metadata: ["id": .stringConvertible(id)])

        let response = try await scan.search(.competition(withID: id, locale: locale))
        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = CompetitionDomainModel(attachment: attachment)
        return competition
    }

    func find(forEvent eventID: EventDomainModel.ID, locale: Locale) async throws -> CompetitionDomainModel? {
        logger.debug("Fetching Competition", metadata: ["event-id": .stringConvertible(eventID)])

        let response = try await scan.search(.competitions(forEvent: eventID, locale: locale))
        guard response.attachments.events?.first?.value.eventID == eventID else {
            return nil
        }

        guard let attachment = response.attachments.competitions?.first?.value else {
            return nil
        }

        let competition = CompetitionDomainModel(attachment: attachment)
        return competition
    }

    func all(forSport sportID: SportDomainModel.ID, locale: Locale) async throws -> [CompetitionDomainModel]? {
        logger.debug("Fetching Competitions", metadata: ["sport-id": .stringConvertible(sportID)])

        let response = try await scan.search(.competitions(forEventType: sportID, locale: locale))
        guard response.attachments.eventTypes?.first?.value.eventTypeID == sportID else {
            return nil
        }

        guard let attachments = response.attachments.competitions?.values else {
            return []
        }

        let competitions = attachments
            .compactMap(CompetitionDomainModel.init)
        return competitions
    }

}

extension Request {

    var competitions: CompetitionProvider {
        self.application.competitionsFactory.make!(self)
    }

}
