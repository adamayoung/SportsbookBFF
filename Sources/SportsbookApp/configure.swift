import Vapor

public func configure(_ app: Application) throws {
    app.http.server.configuration.responseCompression = .enabled
    app.caches.use(.memory)
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))
    setupServices(app)
    try routes(app)
}
