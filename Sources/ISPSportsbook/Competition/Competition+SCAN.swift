import Foundation
import SCAN
import Sportsbook

extension Competition {

    init?(attachment: SCAN.CompetitionAttachment) {
        guard let name = attachment.name else {
            return nil
        }

        self.init(id: attachment.competitionID, name: name, sportID: attachment.eventTypeID)
    }

}
