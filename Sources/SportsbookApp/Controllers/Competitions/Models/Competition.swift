import Foundation

struct Competition: Identifiable, Equatable, Codable {

    let id: Int
    let name: String
    let eventTypeID: Int

    init(id: Int, name: String, eventTypeID: Int) {
        self.id = id
        self.name = name
        self.eventTypeID = eventTypeID
    }

}
