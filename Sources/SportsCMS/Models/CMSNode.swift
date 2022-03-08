import Foundation

public struct CMSNode: Codable {

    public let id: String
    public let name: String
    public let type: CMSNode.CMSNodeType
    public let parentID: String?
    public let sportID: String?
    public let weight: Int?
    public let scheduled: Bool

    public init(id: String, name: String, type: CMSNode.CMSNodeType, parentID: String? = nil, sportID: String? = nil,
                weight: Int? = nil, scheduled: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.parentID = parentID
        self.sportID = sportID
        self.weight = weight
        self.scheduled = scheduled
    }

}

extension CMSNode {

    public enum CMSNodeType: String, Codable {
        case sport = "SPORT"
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

extension CMSNode {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case parentID = "parentId"
        case sportID = "sportId"
        case weight
        case scheduled
    }

}
