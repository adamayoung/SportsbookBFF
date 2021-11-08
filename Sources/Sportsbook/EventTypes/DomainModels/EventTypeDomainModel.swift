import Foundation

public struct EventTypeDomainModel: Identifiable, Equatable, Hashable, Comparable, Codable {

    public let id: Int
    public let name: String
    public let category: EventTypeCategory?

    public init(id: Int, name: String, category: EventTypeCategory? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    public static func < (lhs: EventTypeDomainModel, rhs: EventTypeDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
