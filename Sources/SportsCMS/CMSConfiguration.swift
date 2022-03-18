import SportsCMSCore
import Vapor

public struct CMSConfiguration: CMSConfigurationProviding {

    public let baseURL: String
    public let apiKey: String

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

}

extension CMSConfiguration {

    private static let baseURLKey = "CMS_BASE_URL"
    private static let apiKeyKey = "CMS_API_KEY"

    public static var environment: CMSConfiguration {
        guard let baseURL = Environment.get(baseURLKey) else {
            fatalError("\(baseURLKey) environment variable not set")
        }

        guard let apiKey = Environment.get(apiKeyKey) else {
            fatalError("\(apiKeyKey) environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
