import Foundation
import SportsCMS

extension CMSNodeDomainModel {

    init?(node: CMSNode) {
        guard let id = Int(node.id) else {
            return nil
        }

        let type = CMSNodeDomainModel.NodeType(type: node.type)

        guard let sportId = node.sportId, let eventTypeID = Int(sportId) else {
            return nil
        }

        let eventTypeCategory = EventTypeCategory(eventTypeID: eventTypeID)
        let weight = node.weight ?? 0

        self.init(id: id, name: node.name, type: type, eventTypeID: eventTypeID, eventTypeCategory: eventTypeCategory,
                  weight: weight)
    }

}

extension CMSNodeDomainModel.NodeType {

    init(type: CMSNodeType) {
        switch type {
        case .eventType: self = .eventType
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .marketType: self = .marketType
        }
    }

}
