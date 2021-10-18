import Sportsbook
@testable import SportsbookRestAPI
import XCTVapor

final class CompetitionsControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: CompetitionsController())
        app.competitionService.use { request in
            MockCompetitionService(competitions: Competition.mocks, eventLoop: request.eventLoop)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testCompetitionsForEventTypeReturnsCompetitions() throws {
        let eventTypeID = 1
        let expectedResult = JSONAPIModel<[CompetitionModel]>(
            data: [
                CompetitionModel(id: 516320, name: "Salvadoran Primera Division", eventTypeID: eventTypeID),
                CompetitionModel(id: 2005, name: "UEFA Europa League", eventTypeID: eventTypeID)
            ]
        )

        try app.test(.GET, "event-types/\(eventTypeID)/competitions") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqualJSON(response.body.string, expectedResult)
        }
    }

}
