import Foundation
import Sportsbook

extension EventTypeModel {

    init(eventType: EventType) {
        self.init(id: eventType.id, name: eventType.name)
    }

}
