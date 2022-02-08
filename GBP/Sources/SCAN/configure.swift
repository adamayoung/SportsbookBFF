import GBPCore
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)

    guard let scanBaseURL = Environment.get(.scanBaseURL) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.scanBaseURL) environment variable"
        throw abort
    }

    let scanConfiguration = SCANConfiguration(baseURL: scanBaseURL)

    app.scanService.use { request in
        SCANGBPService(configuration: scanConfiguration, client: request.gbpClient, logger: request.logger)
    }
}

private func modules(_ app: Application) throws {
    try GBPCore.configure(app)
}
