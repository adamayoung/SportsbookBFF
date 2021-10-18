@testable import GBP
import XCTVapor

final class HTTPHeadersTLAEnvironmentTests: XCTestCase {

    func testTLAEnvironmentReturnsHeaderName() {
        let expectedResult = HTTPHeaders.Name("X-Stars-TLA-Env")

        let result = HTTPHeaders.Name.tlaEnvironment

        XCTAssertEqual(result, expectedResult)
    }

    func testISPTLAHeaderReturnsHeaderName() {
        let expectedResult = HTTPHeaders.Name("isp-tla-header")

        let result = HTTPHeaders.Name.ispTLAHeader

        XCTAssertEqual(result, expectedResult)
    }

}
