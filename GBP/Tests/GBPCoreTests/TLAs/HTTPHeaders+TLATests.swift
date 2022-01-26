@testable import GBPCore
import XCTVapor

final class HTTPHeadersTLATests: XCTestCase {

    func testISPTLAHeaderReturnsHeaderName() {
        let expectedResult = HTTPHeaders.Name("isp-tla-header")

        let result = HTTPHeaders.Name.ispTLAHeader

        XCTAssertEqual(result, expectedResult)
    }

}
