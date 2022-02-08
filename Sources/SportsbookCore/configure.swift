import SCAN
import SMP
import SportsCMS
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)

    app.competitionService.use { request in
        CompetitionSCANService(scanService: request.scanService, locale: request.locale, logger: request.logger)
    }

    app.eventService.use { request in
        EventSCANService(scanService: request.scanService, locale: request.locale, logger: request.logger)
    }

    app.eventTypeService.use { request in
        EventTypeSCANService(scanService: request.scanService, locale: request.locale, logger: request.logger)
    }

    app.marketService.use { request in
        MarketSCANService(scanService: request.scanService, locale: request.locale, logger: request.logger)
    }

    app.marketService.use { request in
        MarketSCANService(scanService: request.scanService, locale: request.locale, logger: request.logger)
    }

    app.cmsContentService.use { request in
        CMSContentSportsCMSService(cmsNodeService: request.cmsNodeService, logger: request.logger)
    }
}

private func modules(_ app: Application) throws {
    try SCAN.configure(app)
    try SMP.configure(app)
    try SportsCMS.configure(app)
}
