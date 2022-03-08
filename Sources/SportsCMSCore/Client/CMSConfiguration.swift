import Foundation

public struct CMSConfiguration {

    public let baseURL: String
    public let apiKey: String

    public init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

}
