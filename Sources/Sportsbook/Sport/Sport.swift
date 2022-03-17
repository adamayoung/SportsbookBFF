import Foundation

public struct Sport: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let category: Sport.Category?

    public init(id: Int, name: String, category: Sport.Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    public static func < (lhs: Sport, rhs: Sport) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}

extension Sport {

    public enum Category: CaseIterable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
