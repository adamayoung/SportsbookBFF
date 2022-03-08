import SCAN
import SMP
import SportsCMS
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)

    app.competitionService.use {
        CompetitionSCANService(scanService: $0.scanService, logger: $0.logger)
    }

    app.eventService.use {
        EventSCANService(scanService: $0.scanService, logger: $0.logger)
    }

    app.sportService.use {
        SportSCANService(scanService: $0.scanService, cmsNodeService: $0.cmsNodeService, logger: $0.logger)
    }

    app.marketService.use {
        MarketSCANService(scanService: $0.scanService, logger: $0.logger)
    }

    app.marketPriceService.use {
        MarketPriceSMPService(smpService: $0.smpService, logger: $0.logger)
    }
}

private func modules(_ app: Application) throws {
    try SCAN.configure(app)
    try SMP.configure(app)
    try SportsCMS.configure(app)
}
