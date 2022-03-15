import SportsCMS
import SCAN
import SMP
import Vapor

func setupServices(_ app: Application) {
    app.scan.configuration = .environment
    app.smp.configuration = .environment
    app.sportsCMS.configuration = .environment

    app.competitionsFactory.use {
        CompetitionService(scan: $0.scan, logger: $0.logger)
    }

    app.eventsFactory.use {
        EventService(scan: $0.scan, logger: $0.logger)
    }

    app.sportsFactory.use {
        SportService(scan: $0.scan, cms: $0.sportsCMS, logger: $0.logger)
    }

    app.marketsFactory.use {
        MarketService(scan: $0.scan, logger: $0.logger)
    }

    app.marketPricesFactory.use {
        MarketPriceService(smp: $0.smp, logger: $0.logger)
    }
}
