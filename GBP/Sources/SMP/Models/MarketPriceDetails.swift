import Foundation

public struct MarketPriceDetails: Equatable, Hashable, Codable {

    /// Unique market identifier in the format 'product.market'.
    public let marketId: String
    /// The current state of a market.
    public let marketStatus: MarketStatus
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
    public let bettingType: MarketBettingType
    /// Available runners of the market in no particular order.
    public let runnerDetails: [RunnerDetails]
    /// True if eachway betting is available.
    public let eachwayAvailable: Bool
    /// The number of places for a win market(each way).
    public let numberOfPlaces: Int?
    /// The fraction to which the place price is derived(each way).
    public let placeFraction: FractionalOdds?
    /// Available Leg Types the user can place bets in this market. e.g. Single Selection, Forecast, Wincast, etc.
    public let legTypes: [LegType]?
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

    public init(marketId: String, marketStatus: MarketStatus, turnInPlayEnabled: Bool, inplay: Bool, bspMarket: Bool,
                livePriceAvailable: Bool, guaranteedPriceAvailable: Bool, bettingType: MarketBettingType,
                runnerDetails: [RunnerDetails], eachwayAvailable: Bool, numberOfPlaces: Int? = nil,
                placeFraction: FractionalOdds? = nil, legTypes: [LegType]? = nil, hasBPE: Bool? = nil,
                hasSGM: Bool? = nil, linkedMarketId: String? = nil, betDelay: Int,
                rule4Deductions: [Rule4Deduction]? = nil) {
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
