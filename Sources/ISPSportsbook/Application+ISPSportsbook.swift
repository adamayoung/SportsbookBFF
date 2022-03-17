import SCAN
import SMP
import Sportsbook
import SportsCMS
import Vapor

extension Application.Sportsbooks.Provider {

    public static func isp(_ configuration: ISPSportsbookConfiguration) -> Self {
        .init {
            Self.run($0, configuration: configuration)
        }
    }

    private static func run(_ app: Application, configuration: ISPSportsbookConfiguration) {
        app.scan.configuration = configuration.scanConfiguration
        app.smp.configuration = configuration.smpConfiguration
        app.sportsCMSProviders.use(.isp(configuration.cmsConfiguration))

        app.sportProviders.use { request -> SportProvider in
            SportService(scan: request.scan, cms: request.sportsCMS, logger: request.logger)
        }
        app.competitionProviders.use { request -> CompetitionProvider in
            CompetitionService(scan: request.scan, logger: request.logger)
        }
        app.eventProviders.use { request -> EventProvider in
            EventService(scan: request.scan, logger: request.logger)
        }
        app.marketProviders.use { request -> MarketProvider in
            MarketService(scan: request.scan, logger: request.logger)
        }
        app.marketPriceProviders.use { request -> MarketPriceProvider in
            MarketPriceService(smp: request.smp, logger: request.logger)
        }
    }

}
