import GBPCore
import Vapor

public struct SMPConfiguration: TLAConfigurationProviding {

    public let baseURL: String
    public let apiKey: String

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    public static var environment: SMPConfiguration {
        guard let baseURL = Environment.get("SMP_BASE_URL") else {
            fatalError("SMP_BASE_URL environment variable not set")
        }

        guard let apiKey = Environment.get("TLA_API_KEY") else {
            fatalError("TLA_API_KEY environment variable not set")
        }

        return .init(baseURL: baseURL, apiKey: apiKey)
    }

}
