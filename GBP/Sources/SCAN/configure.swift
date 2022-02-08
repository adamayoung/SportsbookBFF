import GBPCore
import Vapor

public func configure(_ app: Application) throws {
    guard let scanBaseURL = Environment.get(.scanBaseURL) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.scanBaseURL) environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get(.tlaAPIKey) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.tlaAPIKey) environment variable"
        throw abort
    }

    let scanConfiguration = SCANConfiguration(baseURL: scanBaseURL, apiKey: tlaAPIKey)

    app.scanService.use { request in
        SCANGBPService(configuration: scanConfiguration, client: request.gbpClient, logger: request.logger)
    }
}
