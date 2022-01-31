import Vapor

public func configure(_ app: Application) throws {
    guard let scanBaseURL = Environment.get("SCAN_BASE_URL") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing SCAN_BASE_URL environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get("TLA_API_KEY") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing TLA_API_KEY environment variable"
        throw abort
    }

    app.scanService.use { request in
        SCANHTTPService(baseURL: scanBaseURL, tlaAPIKey: tlaAPIKey, client: request.client, logger: request.logger)
    }
}
