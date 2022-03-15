import Foundation
import SMP

extension MarketPriceDomainModel {

    init?(marketPrice: SMP.MarketDetails) {
        guard
            let marketStatus = MarketStatus(marketStatus: marketPrice.marketStatus),
            let bettingType = MarketBettingType(bettingType: marketPrice.bettingType)
        else {
            return nil
        }

        let runnerDetails = marketPrice.runnerDetails.compactMap(RunnerDetailsDomainModel.init)
        let placeFraction = FractionalOddsDomainModel(fractionOdds: marketPrice.placeFraction)
        let legTypes = marketPrice.legTypes?.compactMap(LegType.init)
        let rule4Deductions = marketPrice.rule4Deductions?.compactMap(Rule4DeductionDomainModel.init)

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

    init?(marketStatus: SMP.MarketDetails.MarketStatus) {
        switch marketStatus {
        case .open: self = .open
        case .suspended: self = .suspended
        default:
            return nil
        }
    }

}

extension MarketPriceDomainModel.MarketBettingType {

    init?(bettingType: SMP.MarketDetails.MarketBettingType) {
        switch bettingType {
        case .fixedOdds: self = .fixedOdds
        case .movingHandicap: self = .movingHandicap
        default:
            return nil
        }
    }

}

extension MarketPriceDomainModel.LegType {

    init?(legType: SMP.MarketDetails.LegType) {
        switch legType {
        case .simpleSelection: self = .simpleSelection
        case .forecast: self = .forecast
        case .reverseForecast: self = .reverseForecast
        case .combinationForecase: self = .combinationTricast
        case .tricast: self = .tricast
        case .combinationTricast: self = .combinationTricast
        case .scorecast: self = .scorecast
        case .wincast: self = .wincast
        default:
            return nil
        }
    }

}
