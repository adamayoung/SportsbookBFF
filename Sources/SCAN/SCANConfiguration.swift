import GBPCore
import Vapor

public struct SCANConfiguration: TLAConfigurationProviding {

    public let tlaName = "SCAN"
    public let baseURL: String
    public let apiKey: String

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

}

extension SCANConfiguration {

    private static let baseURLKey = "SCAN_BASE_URL"
    private static let apiKeyKey = "TLA_API_KEY"

    public static var environment: SCANConfiguration {
        guard let baseURL = Environment.get(baseURLKey) else {
            fatalError("\(baseURLKey) environment variable not set")
        }

        guard let apiKey = Environment.get(apiKeyKey) else {
            fatalError("\(apiKeyKey) environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
