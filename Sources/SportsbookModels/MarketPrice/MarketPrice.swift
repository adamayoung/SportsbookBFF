import Foundation

public struct MarketPrice: Identifiable, Equatable, Codable {

    public var id: String { marketID }

    /// Unique market identifier in the format 'product.market'.
    public let marketID: String
    /// The current state of a market.
    public let marketStatus: MarketPrice.MarketStatus
    /// True if a market turns 'in play' at a kick off time, otherwise it is false.
    public let turnInPlayEnabled: Bool
    /// True if a market is currently in play, otherwise it is false.
    public let inPlay: Bool
    /// bspMarket.
    public let bspMarket: Bool
    /// True if live prices are available on the market.
    public let livePriceAvailable: Bool
    /// True if guaranteed price is available on this market.
    public let guaranteedPriceAvailable: Bool
    /// Represents a type of a betting market.
    public let bettingType: MarketPrice.MarketBettingType
    /// Available runners of the market in no particular order.
    public let runnerDetails: [RunnerDetails]
    /// True if eachway betting is available.
    public let eachwayAvailable: Bool
    /// The number of places for a win market(each way).
    public let numberOfPlaces: Int?
    /// The fraction to which the place price is derived(each way).
    public let placeFraction: FractionalOdds?
    /// Available Leg Types the user can place bets in this market. e.g. Single Selection, Forecast, Wincast, etc.
    public let legTypes: [MarketPrice.LegType]?
    /// Is this market BPE (Price Rush) eligible.
    public let hasBPE: Bool?
    /// Is this market eligible for same game multiples?
    public let hasSGM: Bool?
    /// Linked market identifier. Presented in the 'product.market' format.
    public let linkedMarketID: String?
    /// The bet delay for a market.
    public let betDelay: Int
    /// List of Rule4 deductions on the represented market.
    public let rule4Deductions: [Rule4Deduction]?

}

extension MarketPrice {

    public enum MarketStatus: String, CaseIterable, Codable {
        /// Open Market.
        case open
        /// Suspended Market.
        case suspended
        /// Unknown.
        case unknown
    }

    public enum MarketBettingType: String, CaseIterable, Codable {
        /// Fixed Odds Market.
        case fixedOdds
        /// Moving Handicap Market.
        case movingHandicap
        /// Unknown.
        case unknown
    }

    public enum LegType: String, CaseIterable, Codable {
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
        /// Unknown.
        case unknown
    }

}
