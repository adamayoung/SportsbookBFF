import Foundation

public struct ISPSportsbookConfiguration {

    public let scanBaseURL: String
    public let smpBaseURL: String
    public let tlaAPIKey: String
    public let cmsBaseURL: String
    public let cmsAPIKey: String

    public init(scanBaseURL: String, smpBaseURL: String, tlaAPIKey: String, cmsBaseURL: String, cmsAPIKey: String) {
        self.scanBaseURL = scanBaseURL
        self.smpBaseURL = smpBaseURL
        self.tlaAPIKey = tlaAPIKey
        self.cmsBaseURL = cmsBaseURL
        self.cmsAPIKey = cmsAPIKey
    }

}
