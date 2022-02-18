import Foundation
import SportsbookCore

extension Market {

    init(market: MarketDomainModel) {
        let runners = market.runners.map(Runner.init)

        self.init(id: market.id, name: market.name, marketDate: market.marketDate, inPlay: market.inPlay,
                  canTurnInPlay: market.canTurnInPlay, marketType: market.marketType, runners: runners,
                  sportID: market.sportID, eventID: market.eventID, competitionID: market.competitionID)
    }

}
