import Foundation
import SportsbookCore

extension MenuItem {

    init(node: CMSNodeDomainModel) {
        let type = MenuItemType(type: node.type)
        let eventTypeCategory = EventType.Category(category: node.eventTypeCategory)
        self.init(id: node.id, name: node.name, type: type, eventTypeID: node.eventTypeID,
                  eventTypeCategory: eventTypeCategory, weight: node.weight)
    }

}

extension MenuItem.MenuItemType {

    init(type: CMSNodeDomainModel.NodeType) {
        switch type {
        case .eventType: self = .eventType
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .dynamicBanner: self = .dynamicBanner
        case .marketType: self = .marketType
        case .unknown: self = .unknown
        }
    }

}
