import SCAN
import SMP
import SportsCMS
import Vapor

func setupServices(_ app: Application) {
    app.scan.configuration = .environment
    app.smp.configuration = .environment

    guard let cmsBaseURL = Environment.get("CMS_BASE_URL") else {
        fatalError("CMS_BASE_URL environment variable not set")
    }

    guard let cmsAPIKey = Environment.get("CMS_API_KEY") else {
        fatalError("CMS_API_KEY environment variable not set")
    }

    app.sportsCMSProviders.use(.isp(baseURL: cmsBaseURL, apiKey: cmsAPIKey))

    app.competitionProviders.use {
        CompetitionService(scan: $0.scan, logger: $0.logger)
    }

    app.eventProviders.use {
        EventService(scan: $0.scan, logger: $0.logger)
    }

    app.sportProviders.use {
        SportService(scan: $0.scan, cms: $0.sportsCMS, logger: $0.logger)
    }

    app.marketProviders.use {
        MarketService(scan: $0.scan, logger: $0.logger)
    }

    app.marketPriceProviders.use {
        MarketPriceService(smp: $0.smp, logger: $0.logger)
    }
}
