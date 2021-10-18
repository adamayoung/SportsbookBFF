import Foundation

public struct CMSNode: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let type: CMSNodeType
    public let eventTypeID: Int
    public let weight: Int

    public init(id: Int, name: String, type: CMSNodeType, eventTypeID: Int, weight: Int = 0) {
        self.id = id
        self.name = name
        self.type = type
        self.eventTypeID = eventTypeID
        self.weight = weight
    }

    public static func < (lhs: CMSNode, rhs: CMSNode) -> Bool {
        lhs.weight > rhs.weight
    }

}
