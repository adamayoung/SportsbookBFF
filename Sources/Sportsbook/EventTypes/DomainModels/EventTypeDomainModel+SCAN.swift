import Foundation
import GBP

extension EventTypeDomainModel {

    init?(attachment: EventTypeAttachment) {
        guard
            let id = attachment.eventTypeId,
            let name = attachment.name
        else {
            return nil
        }

        let category = EventTypeCategory(eventTypeID: id)

        self.init(id: id, name: name, category: category)
    }

}
