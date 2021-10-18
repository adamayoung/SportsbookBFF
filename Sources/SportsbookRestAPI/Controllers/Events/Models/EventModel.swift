import Vapor

struct EventModel: Equatable, Content {

    let id: Int
    let name: String?
    let eventTypeID: Int?
    let competitionID: Int?
    let countryCode: String?
    let timeZone: TimeZone?
    let openDate: Date?
    let isVideoAvailable: Bool?
    let isInPlay: Bool
    let canTurnInPlay: Bool

}
