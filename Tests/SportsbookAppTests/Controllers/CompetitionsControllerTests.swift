import Sportsbook
@testable import SportsbookApp
import XCTVapor

final class CompetitionsControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: CompetitionsController())
        app.sportProviders.use { _ in
            MockSportService(sports: Sport.mocks)
        }

        app.competitionProviders.use { _ in
            MockCompetitionService(competitions: Competition.mocks)
        }

        app.eventProviders.use { _ in
            MockEventService(events: Event.mocks)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testIndexFromSportReturnsCompetitions() throws {
        let sportID = 1
        let expectedResult = RootDTO(
            data: [
                CompetitionDTO(id: 516320, name: "Salvadoran Primera Division", sportID: sportID),
                CompetitionDTO(id: 2005, name: "UEFA Europa League", sportID: sportID)
            ]
        )

        try app.test(.GET, "sports/\(sportID)/competitions") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<[CompetitionDTO]>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testIndexFromSportWhenSportDoesntExistReturnsNotFound() throws {
        let sportID = 1111

        try app.test(.GET, "sports/\(sportID)/competitions") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testIndexFromSportWhenSportIDIsInvalidReturnsNotFound() throws {
        let sportID = "aaa"

        try app.test(.GET, "sports/\(sportID)/competitions") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowReturnsCompetition() throws {
        let competitionID = 516320
        let expectedResult = RootDTO(
            data: CompetitionDTO(id: 516320, name: "Salvadoran Primera Division", sportID: 1)
        )

        try app.test(.GET, "competitions/\(competitionID)") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<CompetitionDTO>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowWhenCompetitionDoesntExistReturnsNotFound() throws {
        let competitionID = 111111

        try app.test(.GET, "competitions/\(competitionID)") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowWhenCompetitionIDIsInvalidReturnsNotFound() throws {
        let competitionID = "aaa"

        try app.test(.GET, "competitions/\(competitionID)") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventReturnsCompetition() throws {
        let eventID = 30127940
        let expectedResult = RootDTO(
            data: CompetitionDTO(id: 516320, name: "Salvadoran Primera Division", sportID: 1)
        )

        try app.test(.GET, "events/\(eventID)/competition") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<CompetitionDTO>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testShowFromEventWhenEventDoesntExistReturnsNotFound() throws {
        let eventID = 9999999

        try app.test(.GET, "events/\(eventID)/competition") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventWhenEventIDIsInvalidReturnsNotFound() throws {
        let eventID = "aaa"

        try app.test(.GET, "events/\(eventID)/competition") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

    func testShowFromEventWhenCompetitionForEventDoesntExistReturnsNotFound() throws {
        let eventID = 30255780

        try app.test(.GET, "events/\(eventID)/competition") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

}
