import Foundation
import SportsCMS

extension CMSNodeDomainModel {

    init?(node: CMSNode) {
        guard
            let id = Int(node.id),
            let type = CMSNodeDomainModel.NodeType(type: node.type),
            let sportId = node.sportId, let sportID = Int(sportId)
        else {
            return nil
        }

        let sportCategory = SportDomainModel.Category(sportID: sportID)
        let weight = node.weight ?? 0

        self.init(id: id, name: node.name, type: type, sportID: sportID, sportCategory: sportCategory, weight: weight)
    }

}

extension CMSNodeDomainModel.NodeType {

    init?(type: CMSNode.CMSNodeType) {
        switch type {
        case .sport: self = .sport
        case .competition: self = .competition
        case .event: self = .event
        case .staticBanner: self = .staticBanner
        case .dynamicBanner: self = .dynamicBanner
        case .marketType: self = .market
        default:
            return nil
        }
    }

}
