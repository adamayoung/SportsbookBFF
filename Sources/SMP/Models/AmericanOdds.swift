import Foundation

/// Odds represented in American format.
public struct AmericanOdds: Equatable, Hashable, Codable {

    /// The non fractional American representation of these odds.
    public let americanOddsInt: Int

    public init(americanOddsInt: Int) {
        self.americanOddsInt = americanOddsInt
    }

}
