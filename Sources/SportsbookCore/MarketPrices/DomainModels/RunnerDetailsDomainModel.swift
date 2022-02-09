import Foundation

public struct RunnerDetailsDomainModel: Identifiable, Equatable, Hashable {

    public var id: Int { selectionID }

    /// Unique selection identifier.
    public let selectionID: Int
    /// Allow for ordering runners on a market view.
    public let order: Int
    /// Currently available odds to bet, e.g. 2/1 (fractional), 3.0 (decimal).
    public let winOdds: OddsDomainModel?
    /// Currently available eachway average odds , this is a combination of the win and place odds(derived from the market place fraction and runner win odds) divided by the number of lines (2).
    public let eachwayOdds: OddsDomainModel?
    /// Previous odds of the runner, only to be used for display purposes only.
    public let previousWinOdds: [OddsDomainModel]?
    /// The handicap applied to the selection, if on an asian-style market.
    public let handicap: Decimal?
    /// The current state of a runner, e.g. ACTIVE or SUSPENDED
    public let status: Status
    /// If present, indicates the type of price override applied to the runner
    public let priceOverlay: PriceOverlay?
    /// The scope defines in which scope a runner is available for betting based on the market's in-play status. If present betting will be restricted to the indicated scope.
    public let scope: Scope?

    public init(selectionID: Int, order: Int, winOdds: OddsDomainModel? = nil, eachwayOdds: OddsDomainModel? = nil,
                previousWinOdds: [OddsDomainModel]? = nil, handicap: Decimal? = nil,
                status: RunnerDetailsDomainModel.Status, priceOverlay: PriceOverlay? = nil,
                scope: RunnerDetailsDomainModel.Scope? = nil) {
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

public extension RunnerDetailsDomainModel {

    enum Status: CaseIterable {
        /// Active.
        case active
        /// Suspended.
        case suspended
        /// Removed.
        case removed
        /// Unknown.
        case unknown
    }

    enum Scope: CaseIterable {
        /// Runner is available for betting when preplay only.
        case prePlay
        /// Runner is available for betting when inplay only.
        case inPlay
        /// Runner is available for betting when both preplay and inplay
        case all
        /// Unknown.
        case unknown
    }

}
