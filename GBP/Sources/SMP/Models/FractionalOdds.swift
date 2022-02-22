import Foundation

/// Odds represented in fractional format.
///
/// - Note: [GBP | SMP | FractionalOdds](https://github.com/Flutter-Global/cap-product-catalogue/blob/master/api/smp/SMP-IDD.md#FractionalOdds)
public struct FractionalOdds: Equatable, Hashable, Codable {

    /// The numerator of a fractional representation of these odds.
    public let numerator: Int
    /// The denominator of a fractional representation of these odds
    public let denominator: Int

    public init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }

}
