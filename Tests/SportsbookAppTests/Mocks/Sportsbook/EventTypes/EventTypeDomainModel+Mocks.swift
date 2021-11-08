import Foundation
import Sportsbook

extension EventTypeDomainModel {

    static var mocks: [EventTypeDomainModel] {
        [
            EventTypeDomainModel(id: 1, name: "Soccer"),
            EventTypeDomainModel(id: 2, name: "Tennis"),
            EventTypeDomainModel(id: 3, name: "Golf"),
            EventTypeDomainModel(id: 4, name: "Cricket"),
            EventTypeDomainModel(id: 5, name: "Rugby Union"),
            EventTypeDomainModel(id: 6, name: "Boxing")
        ]
    }

}
