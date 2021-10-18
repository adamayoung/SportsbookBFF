import Foundation
import Sportsbook

extension MenuItemModel {

    init(node: Sportsbook.CMSNode) {
        self.init(id: node.id, name: node.name, eventTypeID: node.eventTypeID, weight: node.weight)
    }

}
