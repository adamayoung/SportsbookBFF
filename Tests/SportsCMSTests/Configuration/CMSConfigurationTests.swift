@testable import SportsCMS
import XCTVapor

final class CMSConfigurationTests: XCTestCase {

    func testBaseURLWhenPPBProdEnvironmentReturnsBaseURI() {
        let environment = CMSEnvironment.ppbProd
        let expectedResult = URI(string: "https://cms-api.cms-ppb-dev.isp-pub.starsops.com")
        let configuration = CMSConfiguration(environment: environment)

        let result = configuration.baseURI

        XCTAssertEqual(result.string, expectedResult.string)
    }

    func testBaseURLWhenISPQACoreEnvironmentReturnsBaseURI() {
        let environment = CMSEnvironment.ispQACore
        let expectedResult = URI(string: "https://cms-api.cms-dev.isp-pub.starsops.com")
        let configuration = CMSConfiguration(environment: environment)

        let result = configuration.baseURI

        XCTAssertEqual(result.string, expectedResult.string)
    }

    func testBaseURLWhenISPQREnvironmentReturnsBaseURI() {
        let environment = CMSEnvironment.ispQR
        let expectedResult = URI(string: "https://cms-api.cms-qr.isp-pub.starsops.com")
        let configuration = CMSConfiguration(environment: environment)

        let result = configuration.baseURI

        XCTAssertEqual(result.string, expectedResult.string)
    }

    func testBaseURLWhenISPProdEnvironmentReturnsBaseURI() {
        let environment = CMSEnvironment.ispProd
        let expectedResult = URI(string: "https://cms-api.cms-prod.isp-pub.starsops.com")
        let configuration = CMSConfiguration(environment: environment)

        let result = configuration.baseURI

        XCTAssertEqual(result.string, expectedResult.string)
    }

}
