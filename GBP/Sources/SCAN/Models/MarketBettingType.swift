import Foundation

public enum MarketBettingType: String, Equatable, Hashable, Codable {

    case odds = "ODDS"
    case line = "LINE"
    case range = "RANGE"
    case asianHandicapDoubleLine = "ASIAN_HANDICAP_DOUBLE_LINE"
    case fixedOdds = "FIXED_ODDS"
    case movingHandicap = "MOVING_HANDICAP"
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
