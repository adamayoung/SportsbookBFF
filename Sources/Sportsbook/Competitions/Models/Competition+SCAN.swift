import Foundation
import GBP

extension Competition {

    init?(attachment: CompetitionAttachment) {
        guard
            let name = attachment.name,
            let eventTypeID = attachment.eventTypeId
        else {
            return nil
        }

        self.init(id: attachment.competitionId ?? 0, name: name, eventTypeID: eventTypeID)
    }

}
