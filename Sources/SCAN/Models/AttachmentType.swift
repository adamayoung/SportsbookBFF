import Foundation

public enum AttachmentType: String, CaseIterable, Equatable, Hashable, Codable {

    case eventType = "EVENT_TYPE"
    case competition = "COMPETITION"
    case event = "EVENT"
    case market = "MARKET"
    case sportsbookMarket = "SPORTSBOOK_MARKET"
    case meeting = "MEETING"
    case race = "RACE"
    case marketLite = "MARKET_LITE"
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
