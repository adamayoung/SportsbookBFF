import Foundation
@testable import GBPCore
@testable import SMP
import XCTest

final class MarketDetailsTests: XCTestCase {

    func testDecode() throws {
        let expectedResult = MarketDetails.mock

        let result = try JSONDecoder.tla
            .decode([MarketDetails].self, fromResource: "market-details-1").first!

        XCTAssertEqual(result.marketId, expectedResult.marketId)
        XCTAssertEqual(result.marketStatus, expectedResult.marketStatus)
        XCTAssertEqual(result.turnInPlayEnabled, expectedResult.turnInPlayEnabled)
        XCTAssertEqual(result.inplay, expectedResult.inplay)
        XCTAssertEqual(result.bspMarket, expectedResult.bspMarket)
        XCTAssertEqual(result.livePriceAvailable, expectedResult.livePriceAvailable)
        XCTAssertEqual(result.guaranteedPriceAvailable, expectedResult.guaranteedPriceAvailable)
        XCTAssertEqual(result.bettingType, expectedResult.bettingType)
        XCTAssertEqual(result.runnerDetails, expectedResult.runnerDetails)
        XCTAssertEqual(result.eachwayAvailable, expectedResult.eachwayAvailable)
        XCTAssertEqual(result.numberOfPlaces, expectedResult.numberOfPlaces)
        XCTAssertEqual(result.placeFraction, expectedResult.placeFraction)
        XCTAssertEqual(result.legTypes, expectedResult.legTypes)
        XCTAssertEqual(result.hasBPE, expectedResult.hasBPE)
        XCTAssertEqual(result.hasSGM, expectedResult.hasSGM)
        XCTAssertEqual(result.linkedMarketId, expectedResult.linkedMarketId)
        XCTAssertEqual(result.betDelay, expectedResult.betDelay)
        XCTAssertEqual(result.rule4Deductions, expectedResult.rule4Deductions)
    }

}
