@testable import ISPSportsbook
import XCTest

final class ISPSportsbookConfigurationTests: XCTestCase {

    func testSCANConfigurationReturnsScanConfiguration() {
        let expectedBaseURL = "https://scan.domain.com"
        let expectedAPIKey = "123abc"

        let configuration = ISPSportsbookConfiguration(
            scanBaseURL: expectedBaseURL,
            smpBaseURL: "",
            tlaAPIKey: expectedAPIKey,
            cmsBaseURL: "",
            cmsAPIKey: ""
        )

        let result = configuration.scanConfiguration

        XCTAssertEqual(result.baseURL, expectedBaseURL)
        XCTAssertEqual(result.apiKey, expectedAPIKey)
    }

    func testSMPConfigurationReturnsScanConfiguration() {
        let expectedBaseURL = "https://smp.domain.com"
        let expectedAPIKey = "123abc"

        let configuration = ISPSportsbookConfiguration(
            scanBaseURL: "",
            smpBaseURL: expectedBaseURL,
            tlaAPIKey: expectedAPIKey,
            cmsBaseURL: "",
            cmsAPIKey: ""
        )

        let result = configuration.smpConfiguration

        XCTAssertEqual(result.baseURL, expectedBaseURL)
        XCTAssertEqual(result.apiKey, expectedAPIKey)
    }

    func testCMSConfigurationReturnsScanConfiguration() {
        let expectedBaseURL = "https://cms.domain.com"
        let expectedAPIKey = "123abc"

        let configuration = ISPSportsbookConfiguration(
            scanBaseURL: "",
            smpBaseURL: "",
            tlaAPIKey: "",
            cmsBaseURL: expectedBaseURL,
            cmsAPIKey: expectedAPIKey
        )

        let result = configuration.cmsConfiguration

        XCTAssertEqual(result.baseURL, expectedBaseURL)
        XCTAssertEqual(result.apiKey, expectedAPIKey)
    }

}
