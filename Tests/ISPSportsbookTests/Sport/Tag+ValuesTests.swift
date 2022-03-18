@testable import ISPSportsbook
 import SportsCMS
 import XCTest

 final class TagValuesTests: XCTestCase {

    func testFeaturedReturnsTag() {
        let expectedResult = Tag("featured")

        let result = Tag.featured

        XCTAssertEqual(result, expectedResult)
    }

     func testPopularReturnsTag() {
         let expectedResult = Tag("popular")

         let result = Tag.popular

         XCTAssertEqual(result, expectedResult)
     }

 }
