import Foundation
import SCAN

extension Competition {

    init?(attachment: SCAN.CompetitionAttachment) {
        guard let name = attachment.name else {
            return nil
        }

        self.init(id: attachment.competitionID, name: name, sportID: attachment.eventTypeID)
    }

}
