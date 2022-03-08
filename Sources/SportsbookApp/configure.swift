import SportsbookCore
import Vapor

public func configure(_ app: Application) throws {
    app.caches.use(.memory)
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))

    try modules(app)
    try routes(app)
}

private func modules(_ app: Application) throws {
    try SportsbookCore.configure(app)
}
