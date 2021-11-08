import Foundation

public struct CMSNodeDomainModel: Identifiable, Equatable, Hashable {

    public let id: Int
    public let name: String
    public let type: NodeType
    public let eventTypeID: Int
    public let eventTypeCategory: EventTypeCategory?
    public let weight: Int

    var isSupported: Bool {
        switch type {
        case .eventType, .competition:
            return true

        case .event:
            return eventTypeID != 3

        default:
            return false
        }
    }

    public init(id: Int, name: String, type: NodeType, eventTypeID: Int, eventTypeCategory: EventTypeCategory? = nil,
                weight: Int = 0) {
        self.id = id
        self.name = name
        self.type = type
        self.eventTypeID = eventTypeID
        self.eventTypeCategory = eventTypeCategory
        self.weight = weight
    }

}

public extension CMSNodeDomainModel {

    enum NodeType {

        case eventType
        case competition
        case event
        case staticBanner
        case marketType

    }

}
