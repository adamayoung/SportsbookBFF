import Foundation
import SCAN

extension CompetitionDomainModel {

    init?(attachment: CompetitionAttachment) {
        guard
            let name = attachment.name,
            let sportID = attachment.eventTypeId
        else {
            return nil
        }

        self.init(id: attachment.competitionId ?? 0, name: name, sportID: sportID)
    }

}
