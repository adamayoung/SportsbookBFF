@testable import SportsCMSCore
import Vapor
import XCTest

final class EnvironmentCMSKeysTests: XCTestCase {

    func testCMSAPIKeyReturnsName() {
        let expectedResult = "CMS_API_KEY"

        let result = Environment.Key.cmsAPIKey.description

        XCTAssertEqual(result, expectedResult)
    }

    func testCMSBaseURLReturnsName() {
        let expectedResult = "CMS_BASE_URL"

        let result = Environment.Key.cmsBaseURL.description

        XCTAssertEqual(result, expectedResult)
    }

}
