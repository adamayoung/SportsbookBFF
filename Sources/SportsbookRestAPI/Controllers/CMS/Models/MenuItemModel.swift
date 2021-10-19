import Vapor

struct MenuItemModel: Equatable, Content {

    let id: Int
    let name: String
    let type: MenuItemTypeModel
    let eventTypeID: Int
    let weight: Int

}

extension MenuItemModel {

    enum MenuItemTypeModel: String, Codable {
        case eventType = "EVENT_TYPE"
        case competition = "COMPETITION"
        case event = "EVENT"
        case staticBanner = "STATIC_BANNER"
        case marketType = "MARKET_TYPE"
    }

}
