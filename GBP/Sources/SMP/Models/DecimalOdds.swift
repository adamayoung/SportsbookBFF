import Foundation

/// Odds represented in decimal format.
public struct DecimalOdds: Equatable, Hashable, Codable {

    /// The decimal representation of these odds.
    public let decimalOdds: Decimal

    public init(decimalOdds: Decimal) {
        self.decimalOdds = decimalOdds
    }

}
