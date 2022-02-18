import Foundation

/// An object describing a odds on a selection.
public struct Odds: Equatable, Codable {

    /// The decimal representation of these odds with half round up 2 decimal places. This must not be used for calculations.
    public let decimalOdds: Double?
    /// The fractional representation of these odds. This should be used for all needed calculations.
    public let fractionalOdds: FractionalOdds?

    public init(decimalOdds: Double?, fractionalOdds: FractionalOdds?) {
        self.decimalOdds = decimalOdds
        self.fractionalOdds = fractionalOdds
    }

}
