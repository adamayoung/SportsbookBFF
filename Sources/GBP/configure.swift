import Vapor

public func configure(_ app: Application) throws {
    app.fbrService.use { request in
        FBRHTTPService(configuration: request.fbrConfiguration, client: request.client, eventLoop: request.eventLoop,
                       logger: request.logger)
    }

    app.scanService.use { request in
        SCANHTTPService(configuration: request.scanConfiguration, client: request.client, eventLoop: request.eventLoop,
                        logger: request.logger)
    }

    app.sibService.use { request in
        SIBHTTPService(configuration: request.sibConfiguration, client: request.client, eventLoop: request.eventLoop,
                       logger: request.logger)
    }

    app.smpService.use { request in
        SMPHTTPService(configuration: request.smpConfiguration, client: request.client, eventLoop: request.eventLoop,
                       logger: request.logger)
    }
}
