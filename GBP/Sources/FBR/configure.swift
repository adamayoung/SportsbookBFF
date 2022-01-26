import GBPCore
import Vapor

public func configure(_ app: Application) throws {
    app.fbrService.use { request in
        FBRHTTPService(configuration: request.fbrConfiguration, client: request.client, logger: request.logger)
    }
}
