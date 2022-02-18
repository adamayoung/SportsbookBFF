import Foundation
import SportsbookCore

public struct MenuItem: Identifiable, Equatable, Codable {

    public let id: Int
    public let name: String
    public let type: MenuItem.MenuItemType
    public let sportID: Int
    public let sportCategory: Sport.Category?
    public let weight: Int

    public init(id: Int, name: String, type: MenuItem.MenuItemType, sportID: Int, sportCategory: Sport.Category? = nil,
                weight: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.sportID = sportID
        self.sportCategory = sportCategory
        self.weight = weight
    }

}

public extension MenuItem {

    enum MenuItemType: String, CaseIterable, Codable {
        case sport
        case competition
        case event
        case staticBanner
        case dynamicBanner
        case market
    }

}
