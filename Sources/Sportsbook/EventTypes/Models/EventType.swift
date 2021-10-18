import Foundation

public struct EventType: Identifiable, Equatable, Hashable, Comparable, Codable {

    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    public static func < (lhs: EventType, rhs: EventType) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
