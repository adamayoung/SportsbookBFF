import Foundation

public enum MarketBettingType: String, CaseIterable, Codable {

    /// Fixed Odds Market.
    case fixedOdds = "FIXED_ODDS"
    /// Moving Handicap Market.
    case movingHandicap = "MOVING_HANDICAP"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
