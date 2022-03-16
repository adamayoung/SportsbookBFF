import Foundation

/// Odds represented in fractional format.
struct FractionalOdds: Equatable, Hashable {

    /// The numerator of a fractional representation of these odds.
    let numerator: Int
    /// The denominator of a fractional representation of these odds
    let denominator: Int

    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }

}
