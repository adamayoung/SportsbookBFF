@testable import Sportsbook
import XCTest

final class CMSNodeTests: XCTestCase {

    func testSort() {
        let node0 = CMSNode(id: 0, name: "Node 0", type: .marketType, eventTypeID: 0)
        let node1 = CMSNode(id: 1, name: "Node 1", type: .marketType, eventTypeID: 1, weight: 1)
        let node2 = CMSNode(id: 2, name: "Node 2", type: .marketType, eventTypeID: 2, weight: 2)
        let node3 = CMSNode(id: 3, name: "Node 3", type: .marketType, eventTypeID: 3, weight: 3)
        let expectedResult = [node3, node2, node1, node0]

        let result = [node1, node0, node2, node3].sorted()

        XCTAssertEqual(result, expectedResult)
    }

}
