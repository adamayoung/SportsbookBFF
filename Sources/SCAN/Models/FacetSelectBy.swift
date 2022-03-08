import Foundation

public enum FacetSelectBy: String, CaseIterable, Equatable, Hashable, Codable {

    case minimumTraded = "MINIMUM_TRADED"
    case maximumTraded = "MAXIMUM_TRADED"
    case minimumAvailable = "MINIMUM_AVAILABLE"
    case maximumAvailable = "MAXIMUM_AVAILABLE"
    case firstToStart = "FIRST_TO_START"
    case lastToStart = "LAST_TO_START"
    case rank = "RANK"
    case rankFastLink = "RANK_FAST_LINK"
    case rankSlowLink = "RANK_SLOW_LINK"
    case firstToStartAZ = "FIRST_TO_START_AZ"
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
