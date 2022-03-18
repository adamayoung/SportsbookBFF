import GBPCore
import Vapor

public struct SMPConfiguration: Equatable, TLAConfigurationProviding {

    public let baseURL: String
    public let apiKey: String

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

}

extension SMPConfiguration {

    private static let baseURLKey = "SMP_BASE_URL"
    private static let apiKeyKey = "TLA_API_KEY"

    public static var environment: SMPConfiguration {
        guard let baseURL = Environment.get(baseURLKey) else {
            fatalError("\(baseURLKey) environment variable not set")
        }

        guard let apiKey = Environment.get("TLA_API_KEY") else {
            fatalError("\(apiKeyKey) environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
