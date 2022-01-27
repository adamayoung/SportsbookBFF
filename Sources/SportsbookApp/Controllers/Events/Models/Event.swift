import Foundation

struct Event: Identifiable, Equatable, Codable {

    let id: Int
    let name: String?
    let eventTypeID: Int
    let competitionID: Int?
    let countryCode: String?
    let timeZone: TimeZone?
    let openDate: Date?
    let isVideoAvailable: Bool?
    let isInPlay: Bool
    let canTurnInPlay: Bool

    init(id: Int, name: String?, eventTypeID: Int, competitionID: Int? = nil, countryCode: String? = nil,
         timeZone: TimeZone? = nil, openDate: Date? = nil, isVideoAvailable: Bool? = nil, isInPlay: Bool,
         canTurnInPlay: Bool) {
        self.id = id
        self.name = name
        self.eventTypeID = eventTypeID
        self.competitionID = competitionID
        self.countryCode = countryCode
        self.timeZone = timeZone
        self.openDate = openDate
        self.isVideoAvailable = isVideoAvailable
        self.isInPlay = isInPlay
        self.canTurnInPlay = canTurnInPlay
    }

}
