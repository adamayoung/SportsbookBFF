import Foundation

/// An object describing a odds on a selection. Fairly complex object as it needs to support a number of different use cases.
public struct Odds: Equatable, Hashable, Codable {

    /// The precise representation of these odds, i.e. these are the odds which will be used for calculating any financial aspects of bets using this selection.
    public let trueOdds: TrueOdds
    /// The decimal representation of these odds. Considered to be for display purposes only, it may not be a precise depiction of the odds currently in force. It shows the odds with 2 decimal places after applied the half round up mechanism.
    public let decimalDisplayOdds: DecimalOdds?
    /// The fractional representation of these odds. Considered to be for display purposes only, it may not be a precise depiction of the odds currently in force.
    public let fractionalDisplayOdds: FractionalOdds?
    /// The american representation of these odds. Considered to be for display purposes only, it may not be a precise depiction of the odds currently in force.
    public let americanDisplayOdds: AmericanOdds?

    public init(trueOdds: TrueOdds, decimalDisplayOdds: DecimalOdds? = nil,
                fractionalDisplayOdds: FractionalOdds? = nil, americanDisplayOdds: AmericanOdds? = nil) {
        self.trueOdds = trueOdds
        self.decimalDisplayOdds = decimalDisplayOdds
        self.fractionalDisplayOdds = fractionalDisplayOdds
        self.americanDisplayOdds = americanDisplayOdds
    }

}
