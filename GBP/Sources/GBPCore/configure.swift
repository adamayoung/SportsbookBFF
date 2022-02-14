import Vapor

private var isConfigured = false

public func configure(_ app: Application) throws {
    guard !isConfigured else {
        return
    }

    isConfigured = true

    guard let tlaAPIKey = Environment.get(.tlaAPIKey) else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing \(Environment.Key.tlaAPIKey) environment variable"
        throw abort
    }

    app.gbpService.use {
        GBPHTTPClient(client: $0.client, apiKey: tlaAPIKey, decoder: .tla, logger: $0.logger)
    }
}
