import GBPCore
import Vapor

/// Configures services for Sportsbook Market Prices.
public func configure(_ app: Application) throws {
    try modules(app)

    guard let smpBaseURL = Environment.get(.smpBaseURL) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.smpBaseURL) environment variable"
        throw abort
    }

    let smpConfiguration = SMPConfiguration(baseURL: smpBaseURL)

    app.smpService.use {
        SMPGBPService(configuration: smpConfiguration, client: $0.gbpClient, logger: $0.logger)
    }
}

private func modules(_ app: Application) throws {
    try GBPCore.configure(app)
}
