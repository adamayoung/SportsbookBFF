import Foundation

public struct MarketPrice: Equatable, Hashable, Codable {

    /// Unique market identifier in the format 'product.market'.
    public let marketId: String
    /// The current state of a market.
    public let marketStatus: MarketPrice.MarketStatus
    /// True if a market turns 'in play' at a kick off time, otherwise it is false.
    public let turnInPlayEnabled: Bool
    /// True if a market is currently in play, otherwise it is false.
    public let inplay: Bool
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
    public let linkedMarketId: String?
    /// The bet delay for a market.
    public let betDelay: Int
    /// List of Rule4 deductions on the represented market.
    public let rule4Deductions: [Rule4Deduction]?

    public init(marketId: String, marketStatus: MarketPrice.MarketStatus, turnInPlayEnabled: Bool, inplay: Bool,
                bspMarket: Bool, livePriceAvailable: Bool, guaranteedPriceAvailable: Bool,
                bettingType: MarketPrice.MarketBettingType, runnerDetails: [RunnerDetails], eachwayAvailable: Bool,
                numberOfPlaces: Int? = nil, placeFraction: FractionalOdds? = nil,
                legTypes: [MarketPrice.LegType]? = nil, hasBPE: Bool? = nil, hasSGM: Bool? = nil,
                linkedMarketId: String? = nil, betDelay: Int, rule4Deductions: [Rule4Deduction]? = nil) {
        self.marketId = marketId
        self.marketStatus = marketStatus
        self.turnInPlayEnabled = turnInPlayEnabled
        self.inplay = inplay
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

    public enum MarketStatus: String, CaseIterable, Codable {
        /// Open Market.
        case open = "OPEN"
        /// Suspended Market.
        case suspended = "SUSPENDED"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    public enum MarketBettingType: String, CaseIterable, Codable {
        /// Fixed Odds Market.
        case fixedOdds = "FIXED_ODDS"
        /// Moving Handicap Market.
        case movingHandicap = "MOVING_HANDICAP"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    public enum LegType: String, CaseIterable, Codable {
        /// Simple selection. Contain only one selection per leg.
        case simpleSelection = "SIMPLE_SELECTION"
        /// Straight Forecast. Contain 2 selections per leg finishing in 1st and 2nd places. Straight Forecast bets must be properly filled with the finishing order of the runners.
        case forecast = "FORECAST"
        /// Reverse Forecast. Contains 2 selections per leg finishing in 1st and 2nd in the race in either order.
        case reverseForecast = "REVERSE_FORECAST"
        /// Combination forecast. Contains at least 3 selections per leg with any of them finishing in 1st and 2nd in any order. This is equivalent of having 6 permuted Forecasts.
        case combinationForecase = "COMBINATION_FORECAST"
        /// Straight Tricast. Contains 3 selections per leg finishing in 1st, 2nd and 3rd places. Straight Tricast bets must be properly filled with the finishing order of the runners.
        case tricast = "TRICAST"
        /// Combination Tricast. Contains at least 3 selections per leg finishing in 1st, 2nd and 3rd places in any order. This is equivalent of having 6 permuted Straight Tricasts.
        case combinationTricast = "COMBINATION_TRICAST"
        /// Scorecast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Correct Score selection.
        case scorecast = "SCORECAST"
        /// Wincast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Match Result selection.
        case wincast = "WINCAST"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

}
