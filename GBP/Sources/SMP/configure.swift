import Vapor

public func configure(_ app: Application) throws {
    app.smpService.use { request in
        SMPHTTPService(configuration: request.smpConfiguration, client: request.client, logger: request.logger)
    }
}
