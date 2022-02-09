import Graphiti
@testable import SportsbookApp
import SportsbookCore
import SportsbookModels
import XCTVapor

final class CompetitionRelationshopsTests: XCTestCase {

    var app: Application!
    var request: Request!

    override func setUp() {
        super.setUp()
        app = Application(.testing)
        request = Request(application: app, on: app.eventLoopGroup.next())

        app.eventTypeService.use { _ in
            MockEventTypeService()
        }
    }

    override func tearDown() {
        app.shutdown()
        app = nil
        request = nil
        super.tearDown()
    }

    func testEventTypeReturnsEventTypeForCompetition() {
        let eventType = EventType.mocks[0]
        let competition = Competition(id: 10, name: "Premiere League", eventTypeID: eventType.id)

        competition.eventType(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertEqual(try? result.get(), eventType)
            }
    }

    func testEventTypeWhenEventTypeDoesntExistReturnsNil() {
        let competition = Competition(id: 99, name: "Some Competition", eventTypeID: 99)

        competition.eventType(request: request, arguments: NoArguments.mock)
            .whenComplete { result in
                XCTAssertNil(try? result.get())
            }
    }

}
