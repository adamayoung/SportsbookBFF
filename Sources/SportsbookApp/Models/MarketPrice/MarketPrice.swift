import Foundation

struct MarketPrice: Identifiable, Equatable, Hashable {

    var id: String { marketID }

    /// Unique market identifier in the format 'product.market'.
    let marketID: String
    /// The current state of a market.
    let marketStatus: MarketPrice.MarketStatus
    /// True if a market turns 'in play' at a kick off time, otherwise it is false.
    let turnInPlayEnabled: Bool
    /// True if a market is currently in play, otherwise it is false.
    let inPlay: Bool
    /// bspMarket.
    let bspMarket: Bool
    /// True if live prices are available on the market.
    let livePriceAvailable: Bool
    /// True if guaranteed price is available on this market.
    let guaranteedPriceAvailable: Bool
    /// Represents a type of a betting market.
    let bettingType: MarketPrice.MarketBettingType
    /// Available runners of the market in no particular order.
    let runnerDetails: [RunnerDetails]
    /// True if eachway betting is available.
    let eachwayAvailable: Bool
    /// The number of places for a win market(each way).
    let numberOfPlaces: Int?
    /// The fraction to which the place price is derived(each way).
    let placeFraction: FractionalOdds?
    /// Available Leg Types the user can place bets in this market. e.g. Single Selection, Forecast, Wincast, etc.
    let legTypes: [MarketPrice.LegType]?
    /// Is this market BPE (Price Rush) eligible.
    let hasBPE: Bool?
    /// Is this market eligible for same game multiples?
    let hasSGM: Bool?
    /// Linked market identifier. Presented in the 'product.market' format.
    let linkedMarketId: String?
    /// The bet delay for a market.
    let betDelay: Int
    /// List of Rule4 deductions on the represented market.
    let rule4Deductions: [Rule4Deduction]?

    init(marketID: String, marketStatus: MarketStatus, turnInPlayEnabled: Bool, inPlay: Bool, bspMarket: Bool,
         livePriceAvailable: Bool, guaranteedPriceAvailable: Bool, bettingType: MarketBettingType,
         runnerDetails: [RunnerDetails], eachwayAvailable: Bool, numberOfPlaces: Int? = nil,
         placeFraction: FractionalOdds? = nil, legTypes: [LegType]? = nil, hasBPE: Bool? = nil, hasSGM: Bool? = nil,
         linkedMarketId: String? = nil, betDelay: Int, rule4Deductions: [Rule4Deduction]? = nil) {
        self.marketID = marketID
        self.marketStatus = marketStatus
        self.turnInPlayEnabled = turnInPlayEnabled
        self.inPlay = inPlay
        self.bspMarket = bspMarket
        self.livePriceAvailable = livePriceAvailable
        self.guaranteedPriceAvailable = guaranteedPriceAvailable
        self.bettingType = bettingType
        self.runnerDetails = runnerDetails
        self.eachwayAvailable = eachwayAvailable
        self.numberOfPlaces = numberOfPlaces
        self.placeFraction = placeFraction
        self.legTypes = legTypes
        self.hasBPE = hasBPE
        self.hasSGM = hasSGM
        self.linkedMarketId = linkedMarketId
        self.betDelay = betDelay
        self.rule4Deductions = rule4Deductions
    }

}

extension MarketPrice {

    enum MarketStatus: CaseIterable {
        /// Open Market.
        case open
        /// Suspended Market.
        case suspended
    }

    enum MarketBettingType: CaseIterable {
        /// Fixed Odds Market.
        case fixedOdds
        /// Moving Handicap Market.
        case movingHandicap
    }

    enum LegType: CaseIterable {
        /// Simple selection. Contain only one selection per leg.
        case simpleSelection
        /// Straight Forecast. Contain 2 selections per leg finishing in 1st and 2nd places. Straight Forecast bets must be properly filled with the finishing order of the runners.
        case forecast
        /// Reverse Forecast. Contains 2 selections per leg finishing in 1st and 2nd in the race in either order.
        case reverseForecast
        /// Combination forecast. Contains at least 3 selections per leg with any of them finishing in 1st and 2nd in any order. This is equivalent of having 6 permuted Forecasts.
        case combinationForecase
        /// Straight Tricast. Contains 3 selections per leg finishing in 1st, 2nd and 3rd places. Straight Tricast bets must be properly filled with the finishing order of the runners.
        case tricast
        /// Combination Tricast. Contains at least 3 selections per leg finishing in 1st, 2nd and 3rd places in any order. This is equivalent of having 6 permuted Straight Tricasts.
        case combinationTricast
        /// Scorecast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Correct Score selection.
        case scorecast
        /// Wincast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Match Result selection.
        case wincast
    }

}
