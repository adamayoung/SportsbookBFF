import Foundation

public struct CMSNodeDomainModel: Identifiable, Equatable, Hashable {

    public let id: Int
    public let name: String
    public let type: CMSNodeDomainModel.NodeType
    public let eventTypeID: Int
    public let eventTypeCategory: EventTypeDomainModel.Category?
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

    public init(id: Int, name: String, type: CMSNodeDomainModel.NodeType, eventTypeID: Int,
                eventTypeCategory: EventTypeDomainModel.Category? = nil, weight: Int = 0) {
        self.id = id
        self.name = name
        self.type = type
        self.eventTypeID = eventTypeID
        self.eventTypeCategory = eventTypeCategory
        self.weight = weight
    }

}

extension CMSNodeDomainModel {

    public enum NodeType: CaseIterable {
        case eventType
        case competition
        case event
        case staticBanner
        case dynamicBanner
        case marketType
        case unknown
    }

}
