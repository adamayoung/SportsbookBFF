import Foundation

struct Competition: Identifiable, Equatable, Hashable, Comparable {

    let id: Int
    let name: String
    let sportID: Sport.ID

    init(id: Int, name: String, sportID: Sport.ID) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

    static func < (lhs: Competition, rhs: Competition) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
