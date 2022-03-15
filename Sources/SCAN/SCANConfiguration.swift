import GBPCore
import Vapor

public struct SCANConfiguration: TLAConfigurationProviding {

    public let baseURL: String
    public let apiKey: String

    private static let scanBaseURLKey = "SCAN_BASE_URL"
    private static let tlaAPIKeyKey = "TLA_API_KEY"

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    public static var environment: SCANConfiguration {
        guard let baseURL = Environment.get(scanBaseURLKey) else {
            fatalError("\(scanBaseURLKey) environment variable not set")
        }

        guard let apiKey = Environment.get(tlaAPIKeyKey) else {
            fatalError("\(tlaAPIKeyKey) environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
