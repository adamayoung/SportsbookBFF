import ISPSportsbook
import Sportsbook
import Vapor

public func configure(_ app: Application) throws {
    app.http.server.configuration.responseCompression = .enabled
    app.caches.use(.memory)
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))
    app.sportbooks.use(.isp(.environment))
    try routes(app)
}
