import Vapor

public func configure(_ app: Application) throws {
    app.sibService.use { request in
        SIBHTTPService(configuration: request.sibConfiguration, client: request.client, logger: request.logger)
    }
}
