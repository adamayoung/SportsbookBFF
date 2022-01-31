import GBPCore
import Vapor

public func configure(_ app: Application) throws {
    guard let fbrBaseURL = Environment.get("FBR_BASE_URL") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing FBR_BASE_URL environment variable"
        throw abort
    }

    guard let tlaAPIKey = Environment.get("TLA_API_KEY") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing TLA_API_KEY environment variable"
        throw abort
    }

    app.fbrService.use { request in
        FBRHTTPService(baseURL: fbrBaseURL, tlaAPIKey: tlaAPIKey, client: request.client, logger: request.logger)
    }
}
