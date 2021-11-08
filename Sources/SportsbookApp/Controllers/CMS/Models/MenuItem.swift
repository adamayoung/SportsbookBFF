import Foundation
import Sportsbook

struct MenuItem: Identifiable, Equatable, Codable {

    let id: Int
    let name: String
    let type: MenuItemType
    let eventTypeID: Int
    let eventTypeCategory: EventType.Category?
    let weight: Int

    init(id: Int, name: String, type: MenuItemType, eventTypeID: Int, eventTypeCategory: EventType.Category? = nil,
         weight: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.eventTypeID = eventTypeID
        self.eventTypeCategory = eventTypeCategory
        self.weight = weight
    }

}

extension MenuItem {

    enum MenuItemType: String, Codable {

        case eventType = "EVENT_TYPE"
        case competition = "COMPETITION"
        case event = "EVENT"
        case staticBanner = "STATIC_BANNER"
        case marketType = "MARKET_TYPE"

    }

}
