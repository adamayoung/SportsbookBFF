import Foundation
import SportsCMS

extension CMSNode {

    init(node: SportsCMS.CMSNode) {
        let id = Int(node.id)!
        let type = CMSNodeType(type: node.type)
        let eventTypeID = Int(node.sportId)!
        let weight = node.weight ?? 0

        self.init(id: id, name: node.name, type: type, eventTypeID: eventTypeID, weight: weight)
    }

}
