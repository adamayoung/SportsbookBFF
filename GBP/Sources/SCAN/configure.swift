import Vapor

public func configure(_ app: Application) throws {
    app.scanService.use { request in
        SCANHTTPService(configuration: request.scanConfiguration, client: request.client, logger: request.logger)
    }
}
