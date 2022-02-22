import SportsbookCore
@testable import SportsbookModels
@testable import SportsbookREST
import XCTVapor

final class SportsControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: SportsController())
        app.sportService.use { _ in
            MockSportService(sports: SportDomainModel.mocks)
        }
        app.competitionService.use { _ in
            MockCompetitionService(competitions: CompetitionDomainModel.mocks)
        }
        app.eventService.use { _ in
            MockEventService(events: EventDomainModel.mocks)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testIndexReturnsSports() throws {
        let expectedResult = RootAPIModel(
            data: SportDomainModel.mocks.map(Sport.init)
        )

        try app.test(.GET, "sports") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootAPIModel<[Sport]>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowReturnsSport() throws {
        let sport = Sport(sport: SportDomainModel.mock(for: 1))
        let expectedResult = RootAPIModel(data: sport)

        try app.test(.GET, "sports/\(sport.id)") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootAPIModel<Sport>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowWhenSportDoesntExistReturnsNotFound() throws {
        try app.test(.GET, "sports/999") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowWithInvalidIDReturnsNotFound() throws {
        let sportID = "aaa"

        try app.test(.GET, "sports/\(sportID)") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromCompetitionReturnsSport() throws {
        let competition = CompetitionDomainModel.mock(for: 2005)
        let sport = Sport(sport: SportDomainModel.mock(for: competition.sportID))
        let expectedResult = RootAPIModel(data: sport)

        try app.test(.GET, "competitions/\(competition.id)/sport") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootAPIModel<Sport>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowFromCompetitionWhenCompetitionDoesntExistReturnsNotFound() throws {
        let competitionID = 9999

        try app.test(.GET, "competitions/\(competitionID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromCompetitionWhenSportForCompetitionDoesntExistReturnsNotFound() throws {
        let competition = CompetitionDomainModel.mock(for: 111)

        try app.test(.GET, "competitions/\(competition.sportID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromCompetitionWhenCompetitionIDIsInvalidReturnsNotFound() throws {
        let competitionID = "aaa"

        try app.test(.GET, "competitions/\(competitionID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventReturnsSport() throws {
        let event = EventDomainModel.mock(for: 30127940)
        let sport = Sport(sport: SportDomainModel.mock(for: event.sportID))
        let expectedResult = RootAPIModel(data: sport)

        try app.test(.GET, "events/\(event.id)/sport") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootAPIModel<Sport>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowFromEventWhenEventDoesntExistReturnsNotFound() throws {
        let eventID = 9999

        try app.test(.GET, "events/\(eventID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventWhenSportForEventDoesntExistReturnsNotFound() throws {
        let event = EventDomainModel.mock(for: 9999999)

        try app.test(.GET, "events/\(event.sportID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventWhenEventIDIsInvalidReturnsNotFound() throws {
        let eventID = "aaa"

        try app.test(.GET, "events/\(eventID)/sport") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

}
