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
        app.scanServices.use(.isp(configuration.scanConfiguration))
        app.smpServices.use(.isp(configuration.smpConfiguration))
        app.sportsCMSServices.use(.isp(configuration.cmsConfiguration))

        app.sportServices.use { request -> SportService in
            ISPSportService(scan: request.scan, cms: request.sportsCMS, logger: request.logger)
        }
        app.competitionServices.use { request -> CompetitionService in
            ISPCompetitionService(scan: request.scan, logger: request.logger)
        }
        app.eventServices.use { request -> EventService in
            ISPEventService(scan: request.scan, logger: request.logger)
        }
        app.marketServices.use { request -> MarketService in
            ISPMarketService(scan: request.scan, logger: request.logger)
        }
        app.marketPriceServices.use { request -> MarketPriceService in
            ISPMarketPriceService(smp: request.smp, logger: request.logger)
        }
    }

}
