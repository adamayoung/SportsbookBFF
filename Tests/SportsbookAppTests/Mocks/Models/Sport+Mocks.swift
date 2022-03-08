import Foundation
@testable import SportsbookApp

extension Sport {

    static var mocks: [Sport] {
        [
            Sport(id: 1, name: "Soccer"),
            Sport(id: 2, name: "Tennis"),
            Sport(id: 3, name: "Golf"),
            Sport(id: 4, name: "Cricket"),
            Sport(id: 5, name: "Rugby Union"),
            Sport(id: 6, name: "Boxing")
        ]
    }

}
