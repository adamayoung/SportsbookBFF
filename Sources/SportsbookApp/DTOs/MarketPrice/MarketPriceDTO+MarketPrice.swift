import Foundation
import Sportsbook

extension MarketPriceDTO {

    init(marketPrice: MarketPrice) {
        let marketStatus = MarketPriceDTO.MarketStatus(marketStatus: marketPrice.marketStatus)
        let bettingType = MarketPriceDTO.MarketBettingType(bettingType: marketPrice.bettingType)
        let runnerDetails = marketPrice.runnerDetails.map(RunnerDetailsDTO.init)
        let placeFraction = FractionalOddsDTO(fractionalOdds: marketPrice.placeFraction)
        let legTypes = marketPrice.legTypes?.map(MarketPriceDTO.LegType.init)
        let rule4Deductions = marketPrice.rule4Deductions?.map(Rule4DeductionDTO.init)

        self.init(marketID: marketPrice.marketID, marketStatus: marketStatus,
                  turnInPlayEnabled: marketPrice.turnInPlayEnabled, inPlay: marketPrice.inPlay,
                  bspMarket: marketPrice.bspMarket, livePriceAvailable: marketPrice.livePriceAvailable,
                  guaranteedPriceAvailable: marketPrice.guaranteedPriceAvailable, bettingType: bettingType,
                  runnerDetails: runnerDetails, eachwayAvailable: marketPrice.eachwayAvailable,
                  numberOfPlaces: marketPrice.numberOfPlaces, placeFraction: placeFraction, legTypes: legTypes,
                  hasBPE: marketPrice.hasBPE, hasSGM: marketPrice.hasSGM, linkedMarketID: marketPrice.linkedMarketID,
                  betDelay: marketPrice.betDelay, rule4Deductions: rule4Deductions)
    }

}

extension MarketPriceDTO.MarketStatus {

    init(marketStatus: MarketPrice.MarketStatus) {
        switch marketStatus {
        case .open: self = .open
        case .suspended: self = .suspended
        }
    }

}

extension MarketPriceDTO.MarketBettingType {

    init(bettingType: MarketPrice.MarketBettingType) {
        switch bettingType {
        case .fixedOdds: self = .fixedOdds
        case .movingHandicap: self = .movingHandicap
        }
    }

}

extension MarketPriceDTO.LegType {

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
        }
    }

}
