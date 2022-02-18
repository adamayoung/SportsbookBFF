import Foundation
import SportsbookCore

extension SportDomainModel {

    static var mocks: [SportDomainModel] {
        [
            SportDomainModel(id: 1, name: "Soccer"),
            SportDomainModel(id: 2, name: "Tennis"),
            SportDomainModel(id: 3, name: "Golf"),
            SportDomainModel(id: 4, name: "Cricket"),
            SportDomainModel(id: 5, name: "Rugby Union"),
            SportDomainModel(id: 6, name: "Boxing")
        ]
    }

}
