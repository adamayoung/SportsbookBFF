import Foundation

public struct Competition: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let sportID: Sport.ID

    public init(id: Int, name: String, sportID: Sport.ID) {
        self.id = id
        self.name = name
        self.sportID = sportID
    }

    public static func < (lhs: Competition, rhs: Competition) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
