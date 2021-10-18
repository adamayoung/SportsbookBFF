import GBP
import SportsCMS
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)

    app.competitionService.use { request in
        CompetitionSCANService(scanService: request.scanService, eventLoop: request.eventLoop, locale: request.locale,
                               logger: request.logger)
    }

    app.eventService.use { request in
        EventSCANService(scanService: request.scanService, eventLoop: request.eventLoop, locale: request.locale,
                         logger: request.logger)
    }

    app.eventTypeService.use { request in
        EventTypeSCANService(scanService: request.scanService, eventLoop: request.eventLoop, locale: request.locale,
                             logger: request.logger)
    }

    app.marketService.use { request in
        MarketSCANService(scanService: request.scanService, eventLoop: request.eventLoop, locale: request.locale,
                          logger: request.logger)
    }

    app.marketService.use { request in
        MarketSCANService(scanService: request.scanService, eventLoop: request.eventLoop, locale: request.locale,
                          logger: request.logger)
    }

    app.cmsContentService.use { request in
        CMSContentSportsCMSService(cmsNodeService: request.cmsNodeService, eventLoop: request.eventLoop,
                                   logger: request.logger)
    }
}

private func modules(_ app: Application) throws {
    try GBP.configure(app)
    try SportsCMS.configure(app)
}
