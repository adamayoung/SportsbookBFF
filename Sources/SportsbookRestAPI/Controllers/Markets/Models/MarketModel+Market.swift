import Foundation
import Sportsbook

extension MarketModel {

    init(market: Market) {
        let runners = market.runners.map(RunnerModel.init)

        self.init(id: market.id, name: market.name, marketDate: market.marketDate, inPlay: market.inPlay,
                  canTurnInPlay: market.canTurnInPlay, marketType: market.marketType, runners: runners,
                  eventTypeID: market.eventTypeID, eventID: market.eventID, competitionID: market.competitionID)
    }

}
