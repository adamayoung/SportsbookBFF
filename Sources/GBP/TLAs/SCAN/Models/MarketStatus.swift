import Foundation

public enum MarketStatus: String, CaseIterable, Codable {

    case `open` = "OPEN"
    case inactive = "INACTIVE"
    case suspended = "SUSPENDED"
    case closed = "CLOSED"
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try MarketStatus(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
