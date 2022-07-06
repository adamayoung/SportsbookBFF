import Foundation

/// An object describing a odds on a selection.
public struct Odds: Equatable, Hashable {

    /// The decimal representation of these odds with half round up 2 decimal places. This must not be used for calculations.
    public let decimalOdds: Decimal?
    /// The fractional representation of these odds. This should be used for all needed calculations.
    public let fractionalOdds: FractionalOdds?
    /// The american representation of these odds. Considered to be for display purposes only, it may not be a precise depiction of the odds currently in force.
    public let americanOdds: Int?

    public init(decimalOdds: Decimal? = nil, fractionalOdds: FractionalOdds? = nil, americanOdds: Int? = nil) {
        self.decimalOdds = decimalOdds
        self.fractionalOdds = fractionalOdds
        self.americanOdds = americanOdds
    }

}
