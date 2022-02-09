import Foundation

/// An object describing a odds on a selection.
public struct OddsDomainModel: Equatable, Hashable {

    /// The decimal representation of these odds with half round up 2 decimal places. This must not be used for calculations.
    public let decimalOdds: Decimal?
    /// The fractional representation of these odds. This should be used for all needed calculations.
    public let fractionalOdds: FractionalOddsDomainModel?

    public init(decimalOdds: Decimal? = nil, fractionalOdds: FractionalOddsDomainModel? = nil) {
        self.decimalOdds = decimalOdds
        self.fractionalOdds = fractionalOdds
    }

}
