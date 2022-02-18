import Foundation
import SCAN

extension MarketDomainModel {

    init(id: String, attachment: MarketAttachment) {
        let runners = attachment.runners.compactMap(MarketRunnerDomainModel.init)

        self.init(id: attachment.marketId, name: attachment.marketName, marketDate: attachment.marketTime,
                  inPlay: attachment.inPlay, canTurnInPlay: attachment.canTurnInPlay, marketType: attachment.marketType,
                  runners: runners, sportID: attachment.eventTypeId, eventID: attachment.eventId,
                  competitionID: attachment.competitionId)
    }

}
