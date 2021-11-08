import Foundation

public struct CMSNode: Codable {

    public let id: String
    public let name: String
    public let type: CMSNodeType
    public let parentId: String?
    public let sportId: String?
    public let weight: Int?
    public let scheduled: Bool

    public init(id: String, name: String, type: CMSNodeType, parentId: String? = nil, sportId: String? = nil,
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
