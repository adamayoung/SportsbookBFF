import Vapor

public func configure(_ app: Application) throws {
    app.caches.use(.memory)
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))
    setupServices(app)
    try routes(app)
}
