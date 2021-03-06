import Sportsbook
@testable import SportsbookApp
import XCTVapor

final class EventsControllerTests: XCTestCase {

    var app: Application!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = Application(.testing)
        try app.register(collection: EventsController())
        app.sportServices.use { _ in
            MockSportService(sports: Sport.mocks)
        }

        app.competitionServices.use { _ in
            MockCompetitionService(competitions: Competition.mocks)
        }

        app.eventServices.use { _ in
            MockEventService(events: Event.mocks)
        }

        app.marketServices.use { _ in
            MockMarketService(markets: Market.mocks)
        }
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
        try super.tearDownWithError()
    }

    func testIndexFromSportReturnsEvents() throws {
        let sportID = 2
        let expectedResult = RootDTO(
            data: [
                EventDTO(
                    id: 30236195,
                    name: "C Burel v A Bondar",
                    sportID: 2,
                    competitionID: 794523,
                    countryCode: "GB",
                    timeZone: TimeZone(abbreviation: "GMT"),
                    openDate: Date(iso8601String: "2021-09-26T09:06:37Z"),
                    isVideoAvailable: false,
                    isInPlay: true,
                    canTurnInPlay: true
                ),
                EventDTO(
                    id: 30255779,
                    name: "I Lavino v L Alhussein Abdel Aziz",
                    sportID: 2,
                    competitionID: 529306,
                    countryCode: "GB",
                    timeZone: TimeZone(abbreviation: "GMT"),
                    openDate: Date(iso8601String: "2021-10-01T09:30:00Z"),
                    isVideoAvailable: false,
                    isInPlay: false,
                    canTurnInPlay: true
                ),
                EventDTO(
                    id: 30255780,
                    name: "V Yushchenko v M Capurro Taborda",
                    sportID: 2,
                    competitionID: 11111111,
                    countryCode: "GB",
                    timeZone: TimeZone(abbreviation: "GMT"),
                    openDate: Date(iso8601String: "2021-10-01T09:30:00Z"),
                    isVideoAvailable: false,
                    isInPlay: false,
                    canTurnInPlay: true
                )
            ]
        )

        try app.test(.GET, "sports/\(sportID)/events") { response in
            XCTAssertEqual(response.status, .ok)
            let result = try response.content.decode(RootDTO<[EventDTO]>.self)
            XCTAssertEqual(result, expectedResult)
        }
    }

    func testIndexFromSportWhenSportDoesntExistReturnsNotFound() throws {
        let sportID = 1111

        try app.test(.GET, "sports/\(sportID)/events") { response in
            XCTAssertEqual(response.status, .notFound)
        }
    }

}
