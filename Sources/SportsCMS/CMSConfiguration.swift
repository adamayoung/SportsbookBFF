import SportsCMSCore
import Vapor

public struct CMSConfiguration: CMSConfigurationProviding {

    public let baseURL: String
    public let apiKey: String

    private static let cmsBaseURLKey = "CMS_BASE_URL"
    private static let cmsAPIKeyKey = "CMS_API_KEY"

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    public static var environment: CMSConfiguration {
        guard let baseURL = Environment.get(cmsBaseURLKey) else {
            fatalError("\(cmsBaseURLKey) environment variable not set")
        }

        guard let apiKey = Environment.get(cmsAPIKeyKey) else {
            fatalError("\(cmsAPIKeyKey) environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
