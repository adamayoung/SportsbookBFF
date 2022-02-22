import Foundation

public struct RunnerDetails: Equatable, Hashable, Codable {

    /// Unique selection identifier.
    public let selectionId: Int
    /// Allow for ordering runners on a market view.
    public let runnerOrder: Int
    /// Currently available odds to bet, e.g. 2/1 (fractional), 3.0 (decimal).
    public let winRunnerOdds: Odds?
    /// Currently available eachway average odds , this is a combination of the win and place odds(derived from the market place fraction and runner win odds) divided by the number of lines (2).
    public let eachwayRunnerOdds: Odds?
    /// Previous odds of the runner, only to be used for display purposes only.
    public let previousWinRunnerOdds: [Odds]?
    /// The handicap applied to the selection, if on an asian-style market.
    public let handicap: Decimal?
    /// The current state of a runner.
    public let runnerStatus: RunnerDetails.RunnerStatus
    /// If present, indicates the type of price override applied to the runner.
    public let priceOverlay: RunnerDetails.PriceOverlay?
    /// The scope defines in which scope a runner is available for betting based on the market's in-play status. If present betting will be restricted to the indicated scope.
    public let runnerScope: RunnerDetails.RunnerScope?

    public init(selectionId: Int, runnerOrder: Int, winRunnerOdds: Odds? = nil, eachwayRunnerOdds: Odds? = nil,
                previousWinRunnerOdds: [Odds]? = nil, handicap: Decimal? = nil,
                runnerStatus: RunnerDetails.RunnerStatus, priceOverlay: RunnerDetails.PriceOverlay? = nil,
                runnerScope: RunnerDetails.RunnerScope? = nil) {
        self.selectionId = selectionId
        self.runnerOrder = runnerOrder
        self.winRunnerOdds = winRunnerOdds
        self.eachwayRunnerOdds = eachwayRunnerOdds
        self.previousWinRunnerOdds = previousWinRunnerOdds
        self.handicap = handicap
        self.runnerStatus = runnerStatus
        self.priceOverlay = priceOverlay
        self.runnerScope = runnerScope
    }

}

extension RunnerDetails {

    /// State of a runner.
    public enum RunnerStatus: String, CaseIterable, Codable {
        /// Active.
        case active = "ACTIVE"
        /// Suspended.
        case suspended = "SUSPENDED"
        /// Removed.
        case removed = "REMOVED"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    /// Type of price override applied to the runner.
    public enum PriceOverlay: String, CaseIterable, Codable {
        /// Enhanced Price Promotion.
        case enhancedPricePromotion = "ENHANCED_PRICE_PROMOTION"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    /// Scope a runner is available for betting based on the market's in-play status.
    public enum RunnerScope: String, CaseIterable, Codable {
        /// Runner is available for betting when preplay only.
        case preplay = "PREPLAY"
        /// Runner is available for betting when inplay only.
        case inplay = "INPLAY"
        /// Runner is available for betting when both preplay and inplay
        case all = "ALL"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

}
