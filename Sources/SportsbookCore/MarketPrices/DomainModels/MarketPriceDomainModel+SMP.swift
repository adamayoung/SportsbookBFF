import Foundation
import SMP

extension MarketPriceDomainModel {

    init(marketPrice: MarketPrice) {
        let marketStatus = MarketStatus(marketStatus: marketPrice.marketStatus)
        let bettingType = MarketBettingType(bettingType: marketPrice.bettingType)
        let runnerDetails = marketPrice.runnerDetails.map(RunnerDetailsDomainModel.init)
        let placeFraction = FractionalOddsDomainModel(fractionOdds: marketPrice.placeFraction)
        let legTypes = marketPrice.legTypes?.map(LegType.init)
        let rule4Deductions = marketPrice.rule4Deductions?.map(Rule4DeductionDomainModel.init)

        self.init(marketID: marketPrice.marketId, marketStatus: marketStatus,
                  turnInPlayEnabled: marketPrice.turnInPlayEnabled, inPlay: marketPrice.inplay,
                  bspMarket: marketPrice.bspMarket, livePriceAvailable: marketPrice.livePriceAvailable,
                  guaranteedPriceAvailable: marketPrice.guaranteedPriceAvailable, bettingType: bettingType,
                  runnerDetails: runnerDetails, eachwayAvailable: marketPrice.eachwayAvailable,
                  numberOfPlaces: marketPrice.numberOfPlaces, placeFraction: placeFraction, legTypes: legTypes,
                  hasBPE: marketPrice.hasBPE, hasSGM: marketPrice.hasSGM, linkedMarketId: marketPrice.linkedMarketId,
                  betDelay: marketPrice.betDelay, rule4Deductions: rule4Deductions)
    }

}
