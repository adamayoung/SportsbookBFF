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
    /// The current state of a runner, e.g. ACTIVE or SUSPENDED
    public let runnerStatus: RunnerStatus
    /// If present, indicates the type of price override applied to the runner
    public let priceOverlay: PriceOverlay?
    /// The scope defines in which scope a runner is available for betting based on the market's in-play status. If present betting will be restricted to the indicated scope.
    public let runnerScope: RunnerScope?

    public init(selectionId: Int, runnerOrder: Int, winRunnerOdds: Odds? = nil, eachwayRunnerOdds: Odds? = nil,
                previousWinRunnerOdds: [Odds]? = nil, handicap: Decimal? = nil, runnerStatus: RunnerStatus,
                priceOverlay: PriceOverlay? = nil, runnerScope: RunnerScope? = nil) {
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
