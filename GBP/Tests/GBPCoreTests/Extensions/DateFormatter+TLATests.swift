@testable import GBPCore
import XCTVapor

final class DateFormatterTLATests: XCTestCase {

    func testTLADateFormatter() {
        let dateString = "2022-02-21T19:32:11.000Z"
        let expectedResult = Date(timeIntervalSince1970: 1645471931)
        let dateFormatter = DateFormatter.tla

        let result = dateFormatter.date(from: dateString)

        XCTAssertEqual(result, expectedResult)
    }

}
