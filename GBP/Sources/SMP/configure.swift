import Vapor

public func configure(_ app: Application) throws {
    guard let smpBaseURL = Environment.get(.smpBaseURL) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.smpBaseURL) environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get(.tlaAPIKey) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.tlaAPIKey) environment variable"
        throw abort
    }

    let smpConfiguration = SMPConfiguration(baseURL: smpBaseURL, apiKey: tlaAPIKey)

    app.smpService.use { request in
        SMPGBPService(configuration: smpConfiguration, client: request.gbpClient, logger: request.logger)
    }
}
