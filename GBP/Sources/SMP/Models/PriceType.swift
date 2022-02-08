import Foundation

public enum PriceType: String, CaseIterable, Codable {

    /// Live price (LP).
    case livePrice = "LIVE_PRICE"
    /// Starting price (SP).
    case startingPrice = "STARTING_PRICE"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
