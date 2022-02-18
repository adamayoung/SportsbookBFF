import Foundation

public struct CMSNodeDomainModel: Identifiable, Equatable, Hashable {

    public let id: Int
    public let name: String
    public let type: CMSNodeDomainModel.NodeType
    public let sportID: Int
    public let sportCategory: SportDomainModel.Category?
    public let weight: Int

    var isSupported: Bool {
        switch type {
        case .sport, .competition:
            return true

        case .event:
            return sportID != 3

        default:
            return false
        }
    }

    public init(id: Int, name: String, type: CMSNodeDomainModel.NodeType, sportID: Int,
                sportCategory: SportDomainModel.Category? = nil, weight: Int = 0) {
        self.id = id
        self.name = name
        self.type = type
        self.sportID = sportID
        self.sportCategory = sportCategory
        self.weight = weight
    }

}

extension CMSNodeDomainModel {

    public enum NodeType: CaseIterable {
        case sport
        case competition
        case event
        case market
        case staticBanner
        case dynamicBanner
    }

}
