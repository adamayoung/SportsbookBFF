import Foundation

public struct CMSNode: Codable {

    public let id: String
    public let name: String
    public let type: CMSNode.CMSNodeType
    public let parentId: String?
    public let sportId: String?
    public let weight: Int?
    public let scheduled: Bool

    public init(id: String, name: String, type: CMSNode.CMSNodeType, parentId: String? = nil, sportId: String? = nil,
                weight: Int? = nil, scheduled: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.parentId = parentId
        self.sportId = sportId
        self.weight = weight
        self.scheduled = scheduled
    }

}

extension CMSNode {

    public enum CMSNodeType: String, Codable {
        case eventType = "SPORT"
        case competition = "COMPETITION"
        case event = "EVENT"
        case staticBanner = "STATIC_BANNER"
        case dynamicBanner = "DYNAMIC_BANNER"
        case marketType = "MARKET_TYPE"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

}
