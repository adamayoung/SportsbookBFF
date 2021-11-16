import Foundation

public final class Facet: Equatable, Hashable, Codable {

    public let type: FacetType
    public let next: Facet?

    public init(type: FacetType, next: Facet? = nil) {
        self.type = type
        self.next = next
    }

    public static func == (lhs: Facet, rhs: Facet) -> Bool {
        lhs.type == rhs.type &&
        lhs.next == rhs.next
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(next)
    }

}
