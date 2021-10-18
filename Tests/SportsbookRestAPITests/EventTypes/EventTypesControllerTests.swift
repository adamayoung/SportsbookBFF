import Sportsbook
@testable import SportsbookRestAPI
import XCTVapor

final class EventTypesControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: EventTypesController())
        app.eventTypeService.use { request in
            MockEventTypeService(eventTypes: EventType.mocks, eventLoop: request.eventLoop)
        }
        app.competitionService.use { request in
            MockCompetitionService(competitions: Competition.mocks, eventLoop: request.eventLoop)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testEventTypesReturnsEventTypes() throws {
        let expectedResult = JSONAPIModel<[EventTypeModel]>(
            data: [
                EventTypeModel(id: 1, name: "Soccer"),
                EventTypeModel(id: 2, name: "Tennis"),
                EventTypeModel(id: 3, name: "Golf"),
                EventTypeModel(id: 4, name: "Cricket"),
                EventTypeModel(id: 5, name: "Rugby Union"),
                EventTypeModel(id: 6, name: "Boxing")
            ]
        )

        try app.test(.GET, "event-types") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqualJSON(response.body.string, expectedResult)
        }
    }

    func testEventTypeWithIDReturnsEventType() throws {
        let sport = EventTypeModel(id: 1, name: "Soccer")
        let expectedResult = JSONAPIModel<EventTypeModel>(data: sport)

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
        let eventType = EventTypeModel(id: 1, name: "Soccer")
        let competition = CompetitionModel(id: 2005, name: "UEFA Europa League", eventTypeID: eventType.id)
        let expectedResult = JSONAPIModel<EventTypeModel>(data: eventType)

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
