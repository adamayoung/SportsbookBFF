import Foundation
import Sportsbook

extension MarketDTO {

    init(market: Market) {
        let runners = market.runners.map(RunnerDTO.init)

        self.init(id: market.id, name: market.name, marketDate: market.marketDate, inPlay: market.inPlay,
                  canTurnInPlay: market.canTurnInPlay, marketType: market.marketType, runners: runners,
                  sportID: market.sportID, eventID: market.eventID, competitionID: market.competitionID)
    }

}
