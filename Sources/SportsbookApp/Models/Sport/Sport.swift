import Foundation

struct Sport: Identifiable, Equatable, Hashable, Comparable {

    let id: Int
    let name: String
    let category: Sport.Category?

    init(id: Int, name: String, category: Sport.Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    static func < (lhs: Sport, rhs: Sport) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}

extension Sport {

    enum Category: CaseIterable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
