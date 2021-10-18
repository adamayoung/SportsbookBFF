@testable import Sportsbook
import SportsCMS
import XCTest

final class TagValuesTests: XCTestCase {

    func testFeaturedReturnsTag() {
        let expectedResult = Tag(rawValue: "featured-1734717884")

        let result = Tag.featured

        XCTAssertEqual(result, expectedResult)
    }

}
