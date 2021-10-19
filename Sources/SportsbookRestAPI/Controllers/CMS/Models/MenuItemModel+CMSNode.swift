import Foundation
import Sportsbook

extension MenuItemModel {

    init(node: Sportsbook.CMSNode) {
        let type = MenuItemTypeModel(type: node.type)
        self.init(id: node.id, name: node.name, type: type, eventTypeID: node.eventTypeID, weight: node.weight)
    }

}

extension MenuItemModel.MenuItemTypeModel {

    init(type: Sportsbook.CMSNodeType) {
        switch type {
        case .sport: self = .eventType
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .marketType: self = .marketType
        }
    }

}
