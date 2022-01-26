import Foundation

public struct BetRunnerRunner: Equatable, Hashable, Codable {

    /// Unique market id.
    public let marketId: String
    /// Unique selection id across all selections, e.g. Man Utd has a constant selection id of 100 across all markets.
    public let selectionId: Int
    /// The handicap applied to the selection, if on an asian-style market.
    public let handicap: Double?

    public init(marketId: String, selectionId: Int, handicap: Double? = nil) {
        self.marketId = marketId
        self.selectionId = selectionId
        self.handicap = handicap
    }

}
