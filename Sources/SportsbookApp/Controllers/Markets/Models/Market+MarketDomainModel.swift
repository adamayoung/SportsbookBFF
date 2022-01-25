import Foundation
import Sportsbook

extension Market {

    init(market: Sportsbook.MarketDomainModel) {
        let runners = market.runners.map(Runner.init)

        self.init(id: market.id, name: market.name, marketDate: market.marketDate, inPlay: market.inPlay,
                  canTurnInPlay: market.canTurnInPlay, marketType: market.marketType, runners: runners,
                  eventTypeID: market.eventTypeID, eventID: market.eventID, competitionID: market.competitionID)
    }

}
