import Vapor

public func configure(_ app: Application) throws {
    guard let sibBaseURL = Environment.get("SIB_BASE_URL") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing SIB_BASE_URL environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get("TLA_API_KEY") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing TLA_API_KEY environment variable"
        throw abort
    }

    app.sibService.use { request in
        SIBHTTPService(baseURL: sibBaseURL, tlaAPIKey: tlaAPIKey, client: request.client, logger: request.logger)
    }
}
