import Foundation

public enum RunnerScope: String, CaseIterable, Codable {

    /// Runner is available for betting when preplay only.
    case preplay = "PREPLAY"
    /// Runner is available for betting when inplay only.
    case inplay = "INPLAY"
    /// Runner is available for betting when both preplay and inplay
    case all = "ALL"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
