import Graphiti
import SportsbookCore
@testable import SportsbookGraphQL
import SportsbookModels
import XCTVapor

final class CompetitionRelationshopsTests: XCTestCase {

    var app: Application!
    var request: Request!

    override func setUp() {
        super.setUp()
        app = Application(.testing)
        request = Request(application: app, on: app.eventLoopGroup.next())

        app.sportService.use { _ in
            MockSportService()
        }
    }

    override func tearDown() {
        app.shutdown()
        app = nil
        request = nil
        super.tearDown()
    }

    func testSportReturnsSportForCompetition() {
        let sport = Sport.mocks[0]
        let competition = Competition(id: 10, name: "Premiere League", sportID: sport.id)

        competition.sport(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertEqual(try? result.get(), sport)
            }
    }

    func testSportWhenSportDoesntExistReturnsNil() {
        let competition = Competition(id: 99, name: "Some Competition", sportID: 99)

        competition.sport(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertNil(try? result.get())
            }
    }

}
