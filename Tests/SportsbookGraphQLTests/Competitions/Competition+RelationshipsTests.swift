import Graphiti
import Sportsbook
@testable import SportsbookGraphQL
import XCTVapor

final class CompetitionRelationshopsTests: XCTestCase {

    var app: Application!
    var request: Request!

    override func setUp() {
        super.setUp()
        app = Application(.testing)
        request = Request(application: app, on: app.eventLoopGroup.next())

        app.eventTypeService.use { request in
            MockEventTypeService(eventLoop: request.eventLoop)
        }
    }

    override func tearDown() {
        app.shutdown()
        app = nil
        request = nil
        super.tearDown()
    }

    func testEventTypeReturnsEventTypeForCompetition() throws {
        let competition = Competition(id: 10, name: "Premiere League", eventTypeID: 1)

        try competition.eventType(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertEqual(try? result.get(), EventType.mocks.first)
            }
    }

    func testEventTypeWhenEventTypeDoesntExistReturnsNil() throws {
        let competition = Competition(id: 99, name: "Some Competition", eventTypeID: 99)

        try competition.eventType(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertNil(try? result.get())
            }
    }

}
