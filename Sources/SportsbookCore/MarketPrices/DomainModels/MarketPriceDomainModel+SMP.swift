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

extension MarketPriceDomainModel.MarketStatus {

    init(marketStatus: MarketPrice.MarketStatus) {
        switch marketStatus {
        case .open: self = .open
        case .suspended: self = .suspended
        case .unknown: self = .unknown
        }
    }

}

extension MarketPriceDomainModel.MarketBettingType {

    init(bettingType: MarketPrice.MarketBettingType) {
        switch bettingType {
        case .fixedOdds: self = .fixedOdds
        case .movingHandicap: self = .movingHandicap
        case .unknown: self = .unknown
        }
    }

}

extension MarketPriceDomainModel.LegType {

    init(legType: MarketPrice.LegType) {
        switch legType {
        case .simpleSelection: self = .simpleSelection
        case .forecast: self = .forecast
        case .reverseForecast: self = .reverseForecast
        case .combinationForecase: self = .combinationTricast
        case .tricast: self = .tricast
        case .combinationTricast: self = .combinationTricast
        case .scorecast: self = .scorecast
        case .wincast: self = .wincast
        case .unknown: self = .unknown
        }
    }

}
