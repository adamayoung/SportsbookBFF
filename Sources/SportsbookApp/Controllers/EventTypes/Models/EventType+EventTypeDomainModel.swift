import Foundation
import Sportsbook

extension EventType {

    init(eventType: EventTypeDomainModel) {
        let category = Category(category: eventType.category)

        self.init(id: eventType.id, name: eventType.name, category: category)
    }

}

extension EventType.Category {

    init?(category: EventTypeCategory?) {
        guard let category = category else {
            return nil
        }

        switch category {
        case .outright: self = .outright
        case .avb: self = .avb
        case .racingNew: self = .racingNew
        case .racingOld: self = .racingOld
        }
    }

}
