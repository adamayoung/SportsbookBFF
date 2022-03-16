import Foundation
import SCAN

extension Market {

    init?(id: String, attachment: MarketAttachment) {
        guard
            let marketName = attachment.marketName,
            let marketDate = attachment.marketTime,
            let attachmentRunners = attachment.runners
        else {
            return nil
        }

        let runners = attachmentRunners.compactMap(MarketRunner.init)

        self.init(id: attachment.marketID, name: marketName, marketDate: marketDate, inPlay: attachment.inPlay,
                  canTurnInPlay: attachment.canTurnInPlay, marketType: attachment.marketType, runners: runners,
                  sportID: attachment.eventTypeID, eventID: attachment.eventID, competitionID: attachment.competitionID)
    }

}
