import Foundation

struct EventType: Identifiable, Equatable, Codable {

    let id: Int
    let name: String
    let category: Category?

    init(id: Int, name: String, category: Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

}

extension EventType {

    enum Category: String, CaseIterable, Codable {

        case avb = "AVB"
        case outright = "OUTRIGHT"
        case racingNew = "RACING_NEW"
        case racingOld = "RACING_OLD"

    }

}
