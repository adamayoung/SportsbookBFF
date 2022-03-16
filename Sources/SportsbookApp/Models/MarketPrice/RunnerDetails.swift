import Foundation

struct RunnerDetails: Identifiable, Equatable, Hashable {

    var id: Int { selectionID }

    /// Unique selection identifier.
    let selectionID: Int
    /// Allow for ordering runners on a market view.
    let order: Int
    /// Currently available odds to bet, e.g. 2/1 (fractional), 3.0 (decimal).
    let winOdds: Odds?
    /// Currently available eachway average odds , this is a combination of the win and place odds(derived from the market place fraction and runner win odds) divided by the number of lines (2).
    let eachwayOdds: Odds?
    /// Previous odds of the runner, only to be used for display purposes only.
    let previousWinOdds: [Odds]?
    /// The handicap applied to the selection, if on an asian-style market.
    let handicap: Decimal?
    /// The current state of a runner, e.g. ACTIVE or SUSPENDED
    let status: RunnerDetails.Status
    /// If present, indicates the type of price override applied to the runner
    let priceOverlay: RunnerDetails.PriceOverlay?
    /// The scope defines in which scope a runner is available for betting based on the market's in-play status. If present betting will be restricted to the indicated scope.
    let scope: RunnerDetails.Scope?

    init(selectionID: Int, order: Int, winOdds: Odds? = nil, eachwayOdds: Odds? = nil, previousWinOdds: [Odds]? = nil,
         handicap: Decimal? = nil, status: RunnerDetails.Status, priceOverlay: RunnerDetails.PriceOverlay? = nil,
         scope: RunnerDetails.Scope? = nil) {
        self.selectionID = selectionID
        self.order = order
        self.winOdds = winOdds
        self.eachwayOdds = eachwayOdds
        self.previousWinOdds = previousWinOdds
        self.handicap = handicap
        self.status = status
        self.priceOverlay = priceOverlay
        self.scope = scope
    }

}

extension RunnerDetails {

    enum Status: CaseIterable {
        /// Active.
        case active
        /// Suspended.
        case suspended
        /// Removed.
        case removed
    }

    enum PriceOverlay: CaseIterable {
        /// Enhanced Price Promotion.
        case enhancedPricePromotion
    }

    enum Scope: CaseIterable {
        /// Runner is available for betting when preplay only.
        case prePlay
        /// Runner is available for betting when inplay only.
        case inPlay
        /// Runner is available for betting when both preplay and inplay
        case all
    }

}
