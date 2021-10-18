import Foundation
import GBP

extension EventType {

    init?(attachment: EventTypeAttachment) {
        guard
            let id = attachment.eventTypeId,
            let name = attachment.name
        else {
            return nil
        }

        self.init(id: id, name: name)
    }

}
