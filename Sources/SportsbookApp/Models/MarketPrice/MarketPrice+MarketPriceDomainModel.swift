import Foundation

extension MarketPrice {

    init(marketPrice: MarketPriceDomainModel) {
        let marketStatus = MarketPrice.MarketStatus(marketStatus: marketPrice.marketStatus)
        let bettingType = MarketPrice.MarketBettingType(bettingType: marketPrice.bettingType)
        let runnerDetails = marketPrice.runnerDetails.map(RunnerDetails.init)
        let placeFraction = FractionalOdds(fractionalOdds: marketPrice.placeFraction)
        let legTypes = marketPrice.legTypes?.map(MarketPrice.LegType.init)
        let rule4Deductions = marketPrice.rule4Deductions?.map(Rule4Deduction.init)

        self.init(marketID: marketPrice.marketID, marketStatus: marketStatus,
                  turnInPlayEnabled: marketPrice.turnInPlayEnabled, inPlay: marketPrice.inPlay,
                  bspMarket: marketPrice.bspMarket, livePriceAvailable: marketPrice.livePriceAvailable,
                  guaranteedPriceAvailable: marketPrice.guaranteedPriceAvailable, bettingType: bettingType,
                  runnerDetails: runnerDetails, eachwayAvailable: marketPrice.eachwayAvailable,
                  numberOfPlaces: marketPrice.numberOfPlaces, placeFraction: placeFraction, legTypes: legTypes,
                  hasBPE: marketPrice.hasBPE, hasSGM: marketPrice.hasSGM, linkedMarketID: marketPrice.linkedMarketId,
                  betDelay: marketPrice.betDelay, rule4Deductions: rule4Deductions)
    }

}

extension MarketPrice.MarketStatus {

    init(marketStatus: MarketPriceDomainModel.MarketStatus) {
        switch marketStatus {
        case .open: self = .open
        case .suspended: self = .suspended
        }
    }

}

extension MarketPrice.MarketBettingType {

    init(bettingType: MarketPriceDomainModel.MarketBettingType) {
        switch bettingType {
        case .fixedOdds: self = .fixedOdds
        case .movingHandicap: self = .movingHandicap
        }
    }

}

extension MarketPrice.LegType {

    init(legType: MarketPriceDomainModel.LegType) {
        switch legType {
        case .simpleSelection: self = .simpleSelection
        case .forecast: self = .forecast
        case .reverseForecast: self = .reverseForecast
        case .combinationForecase: self = .combinationTricast
        case .tricast: self = .tricast
        case .combinationTricast: self = .combinationTricast
        case .scorecast: self = .scorecast
        case .wincast: self = .wincast
        }
    }

}
