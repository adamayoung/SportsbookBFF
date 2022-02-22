import Foundation

/// Odds represented in decimal format.
///
/// - Note: [GBP | SMP | Decimal Odds](https://github.com/Flutter-Global/cap-product-catalogue/blob/master/api/smp/SMP-IDD.md#DecimalOdds)
public struct DecimalOdds: Equatable, Hashable, Codable {

    /// The decimal representation of these odds.
    public let decimalOdds: Decimal

    public init(decimalOdds: Decimal) {
        self.decimalOdds = decimalOdds
    }

}
