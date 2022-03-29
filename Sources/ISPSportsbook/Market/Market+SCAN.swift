import Foundation
import SCAN
import Sportsbook

extension Sportsbook.Market {

    init?(id: String, attachment: SCAN.MarketAttachment) {
        guard
            let marketName = attachment.marketName,
            let marketDate = attachment.marketTime,
            let attachmentRunners = attachment.runners
        else {
            return nil
        }

        let runners = attachmentRunners.compactMap(MarketRunner.init)
        guard !runners.isEmpty else {
            return nil
        }

        let marketType = MarketType(attachment.marketType)

        self.init(id: attachment.marketID, name: marketName, marketDate: marketDate, inPlay: attachment.inPlay,
                  canTurnInPlay: attachment.canTurnInPlay, marketType: marketType, runners: runners,
                  sportID: attachment.eventTypeID, eventID: attachment.eventID, competitionID: attachment.competitionID)
    }

}
