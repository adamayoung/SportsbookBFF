import Foundation

public enum MarketStatus: String, CaseIterable, Codable {

    /// Open Market.
    case open = "OPEN"
    /// Suspended Market.
    case suspended = "SUSPENDED"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
