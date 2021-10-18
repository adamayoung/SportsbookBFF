import Vapor

struct MenuItemModel: Equatable, Content {

    let id: Int
    let name: String
//    let type: CMSNodeType
    let eventTypeID: Int
    let weight: Int

}
