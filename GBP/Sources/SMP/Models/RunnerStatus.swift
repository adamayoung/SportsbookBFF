import Foundation

public enum RunnerStatus: String, CaseIterable, Codable {

    /// Active.
    case active = "ACTIVE"
    /// Suspended.
    case suspended = "SUSPENDED"
    /// Removed.
    case removed = "REMOVED"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
