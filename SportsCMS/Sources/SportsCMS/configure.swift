import Vapor

public func configure(_ app: Application) throws {
    app.cmsNodeService.use { request in
        NodeHTTPService(configuration: request.cmsConfiguration, client: request.client, eventLoop: request.eventLoop,
                        logger: request.logger)
    }
}
