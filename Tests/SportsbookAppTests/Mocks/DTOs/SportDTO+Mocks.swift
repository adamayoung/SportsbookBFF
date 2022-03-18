import Foundation
@testable import SportsbookApp

extension SportDTO {

    static var mocks: [SportDTO] {
        [
            SportDTO(id: 1, name: "Soccer"),
            SportDTO(id: 2, name: "Tennis"),
            SportDTO(id: 3, name: "Golf"),
            SportDTO(id: 4, name: "Cricket"),
            SportDTO(id: 5, name: "Rugby Union"),
            SportDTO(id: 6, name: "Boxing")
        ]
    }

}
