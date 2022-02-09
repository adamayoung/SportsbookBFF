import Foundation
import SportsbookCore

public struct MenuItem: Identifiable, Equatable, Codable {

    public let id: Int
    public let name: String
    public let type: MenuItemType
    public let eventTypeID: Int
    public let eventTypeCategory: EventType.Category?
    public let weight: Int

    public init(id: Int, name: String, type: MenuItemType, eventTypeID: Int,
                eventTypeCategory: EventType.Category? = nil, weight: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.eventTypeID = eventTypeID
        self.eventTypeCategory = eventTypeCategory
        self.weight = weight
    }

}

public extension MenuItem {

    enum MenuItemType: String, Codable {
        case eventType = "EVENT_TYPE"
        case competition = "COMPETITION"
        case event = "EVENT"
        case staticBanner = "STATIC_BANNER"
        case dynamicBanner = "DYNAMIC_BANNER"
        case marketType = "MARKET_TYPE"
    }

}
