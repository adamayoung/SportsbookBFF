import Vapor

public func configure(_ app: Application) throws {
    guard let smpBaseURL = Environment.get("SMP_BASE_URL") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing SMP_BASE_URL environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get("TLA_API_KEY") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing TLA_API_KEY environment variable"
        throw abort
    }

    app.smpService.use { request in
        SMPHTTPService(baseURL: smpBaseURL, tlaAPIKey: tlaAPIKey, client: request.client, logger: request.logger)
    }
}
