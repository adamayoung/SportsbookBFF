import GBPCore
import Vapor

public func configure(_ app: Application) throws {
    try modules(app)

    guard let smpBaseURL = Environment.get(.smpBaseURL) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.smpBaseURL) environment variable"
        throw abort
    }

    let smpConfiguration = SMPConfiguration(baseURL: smpBaseURL)

    app.smpService.use { request in
        SMPGBPService(configuration: smpConfiguration, client: request.gbpClient, logger: request.logger)
    }
}

private func modules(_ app: Application) throws {
    try GBPCore.configure(app)
}
