@testable import GBPCore
import XCTVapor

final class EnvironmentGBPKeysTests: XCTestCase {

    func testTLAAPIKeyReturnsEnvironmentKey() {
        let expectedResult = Environment.Key("TLA_API_KEY")

        let result = Environment.Key.tlaAPIKey

        XCTAssertEqual(result, expectedResult)
    }

}
