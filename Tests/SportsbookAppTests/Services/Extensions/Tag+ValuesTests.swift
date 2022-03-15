@testable import SportsbookApp
import SportsCMS
import XCTest

final class TagValuesTests: XCTestCase {

    func testFeaturedReturnsTag() {
        let expectedResult = Tag("featured")

        let result = Tag.featured

        XCTAssertEqual(result, expectedResult)
    }

}
