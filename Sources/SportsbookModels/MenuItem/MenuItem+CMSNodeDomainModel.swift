import Foundation
import SportsbookCore

extension MenuItem {

    init(node: CMSNodeDomainModel) {
        let type = MenuItemType(type: node.type)
        let sportCategory = Sport.Category(category: node.sportCategory)
        self.init(id: node.id, name: node.name, type: type, sportID: node.sportID,
                  sportCategory: sportCategory, weight: node.weight)
    }

}

extension MenuItem.MenuItemType {

    init(type: CMSNodeDomainModel.NodeType) {
        switch type {
        case .sport: self = .sport
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .dynamicBanner: self = .dynamicBanner
        case .market: self = .market
        }
    }

}
