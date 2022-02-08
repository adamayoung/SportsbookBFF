import Foundation
@testable import GBPCore
@testable import SMP
import XCTest

final class MarketDetailsTests: XCTestCase {

    func testDecode() throws {
        _ = try JSONDecoder.tla
            .decode([MarketDetails].self, fromResource: "market-prices-1", withExtension: "json")
    }

}
