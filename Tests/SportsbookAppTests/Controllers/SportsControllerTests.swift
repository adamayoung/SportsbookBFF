import Sportsbook
@testable import SportsbookApp
import XCTVapor

final class SportsControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: SportsController())
        app.sportServices.use { _ in
            MockSportService(sports: Sport.mocks)
        }
        app.competitionServices.use { _ in
            MockCompetitionService(competitions: Competition.mocks)
        }
        app.eventServices.use { _ in
            MockEventService(events: Event.mocks)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testIndexReturnsSports() throws {
        let expectedResult = RootDTO(
            data: Sport.mocks.map(SportDTO.init)
        )

        try app.test(.GET, "sports") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<[SportDTO]>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowReturnsSport() throws {
        let sport = SportDTO(sport: Sport.mock(for: 1))
        let expectedResult = RootDTO(data: sport)

        try app.test(.GET, "sports/\(sport.id)") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<SportDTO>.self)
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
        let competition = Competition.mock(for: 2005)
        let sport = SportDTO(sport: Sport.mock(for: competition.sportID))
        let expectedResult = RootDTO(data: sport)

        try app.test(.GET, "competitions/\(competition.id)/sport") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<SportDTO>.self)
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
        let competition = Competition.mock(for: 111)

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
        let event = Event.mock(for: 30127940)
        let sport = SportDTO(sport: Sport.mock(for: event.sportID))
        let expectedResult = RootDTO(data: sport)

        try app.test(.GET, "events/\(event.id)/sport") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<SportDTO>.self)
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
        let event = Event.mock(for: 9999999)

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
