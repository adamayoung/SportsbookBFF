import SportsCMSCore
import Vapor

public func configure(_ app: Application) throws {
    guard let cmsBaseURL = Environment.get("CMS_BASE_URL") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing CMS_BASE_URL environment variable"
        throw abort
    }

    guard let cmsAPIKey = Environment.get("CMS_API_KEY") else {
        var abort = Abort(.internalServerError)
        abort.reason = "Missing CMS_API_KEY environment variable"
        throw abort
    }

    let cmsConfiguration = CMSConfiguration(baseURL: cmsBaseURL, apiKey: cmsAPIKey)

    app.cmsNodeService.use { request in
        NodeCMSService(configuration: cmsConfiguration, client: request.cmsClient, logger: request.logger)
    }
}
