import Foundation
import SCAN

extension CompetitionDomainModel {

    init?(attachment: CompetitionAttachment) {
        guard let name = attachment.name else {
            return nil
        }

        self.init(id: attachment.competitionID, name: name, sportID: attachment.eventTypeID)
    }

}
