import Sportsbook
@testable import SportsbookApp
import XCTVapor

final class EventTypesControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: EventTypesController())
        app.eventTypeService.use { request in
            MockEventTypeService(eventTypes: EventTypeDomainModel.mocks)
        }
        app.competitionService.use { request in
            MockCompetitionService(competitions: CompetitionDomainModel.mocks)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testEventTypesReturnsEventTypes() throws {
        let expectedResult = JSONAPIModel(
            data: [
                EventType(id: 1, name: "Soccer"),
                EventType(id: 2, name: "Tennis"),
                EventType(id: 3, name: "Golf"),
                EventType(id: 4, name: "Cricket"),
                EventType(id: 5, name: "Rugby Union"),
                EventType(id: 6, name: "Boxing")
            ]
        )

        try app.test(.GET, "event-types") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqualJSON(response.body.string, expectedResult)
        }
    }

    func testEventTypeWithIDReturnsEventType() throws {
        let sport = EventType(id: 1, name: "Soccer")
        let expectedResult = JSONAPIModel(data: sport)

        try app.test(.GET, "event-types/\(sport.id)") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqualJSON(response.body.string, expectedResult)
        }
    }

    func testSportWithIDReturnsNotFound() throws {
        try app.test(.GET, "event-types/999") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testEventTypeForCompetitionReturnsEventType() throws {
        let eventType = EventType(id: 1, name: "Soccer")
        let competition = Competition(id: 2005, name: "UEFA Europa League", eventTypeID: eventType.id)
        let expectedResult = JSONAPIModel(data: eventType)

        try app.test(.GET, "competitions/\(competition.id)/event-type") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqualJSON(response.body.string, expectedResult)
        }
    }

    func testEventTypeForCompetitionReturnsNotFound() throws {
        try app.test(.GET, "competitions/9999/event-type") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

}
