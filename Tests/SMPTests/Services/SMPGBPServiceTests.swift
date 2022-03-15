//import Foundation
//import Logging
//@testable import SMP
//import XCTest
//
//final class SMPGBPServiceTests: XCTestCase {
//
//    var service: SMP!
//    var configuration: SMPConfiguration!
//    var gbpClient: MockGBPClient!
//    var logger: Logger!
//
//    override func setUp() {
//        super.setUp()
//        configuration = .mock
//        gbpClient = MockGBPClient()
//        logger = Logger(label: "SMPTests")
//        service = SMP(configuration: configuration, client: gbpClient, logger: logger)
//    }
//
//    override func tearDown() {
//        service = nil
//        gbpClient = nil
//        configuration = nil
//        logger = nil
//        super.tearDown()
//    }
//
//    func testMarketPricesWithMaketIDsMaxResultsReturnsMarketPrices() async throws {
//        let marketIds = ["1", "2", "3", "4"]
//        let maxResults = 10
//        let expectedBody = MarketPricesRequest(marketIds: marketIds, priceHistory: maxResults)
//        let expectedResult = [MarketDetails.mock]
//
//        gbpClient.result = .success(expectedResult)
//
//        let result = try await service.marketPrices(forMarkets: marketIds, maxResults: maxResults)
//
//        XCTAssertEqual(gbpClient.lastPath, "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1")
//        XCTAssertEqual(gbpClient.lastBody as? MarketPricesRequest, expectedBody)
//        XCTAssertEqual(gbpClient.lastConfiguration as? SMPConfiguration, configuration)
//        XCTAssertEqual(result, expectedResult)
//    }
//
//    func testMarketPricesWithMaketIDsReturnsMarketPrices() async throws {
//        let marketIds = ["1", "2", "3", "4"]
//        let expectedBody = MarketPricesRequest(marketIds: marketIds)
//        let expectedResult = [MarketDetails.mock]
//
//        gbpClient.result = .success(expectedResult)
//
//        let result = try await service.marketPrices(forMarkets: marketIds)
//
//        XCTAssertEqual(gbpClient.lastPath, "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1")
//        XCTAssertEqual(gbpClient.lastBody as? MarketPricesRequest, expectedBody)
//        XCTAssertEqual(gbpClient.lastConfiguration as? SMPConfiguration, configuration)
//        XCTAssertEqual(result, expectedResult)
//    }
//
//    func testMarketPricesWithMaketIDReturnsMarketPrices() async throws {
//        let marketId = "1"
//        let expectedBody = MarketPricesRequest(marketId: marketId)
//        let expectedResult = MarketDetails.mock
//
//        gbpClient.result = .success([expectedResult])
//
//        let result = try await service.marketPrices(forMarket: marketId)
//
//        XCTAssertEqual(gbpClient.lastPath, "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1")
//        XCTAssertEqual(gbpClient.lastBody as? MarketPricesRequest, expectedBody)
//        XCTAssertEqual(gbpClient.lastConfiguration as? SMPConfiguration, configuration)
//        XCTAssertEqual(result, expectedResult)
//    }
//
//}
