import Vapor

struct Event: Identifiable, Equatable {

    let id: Int
    let name: String?
    let sportID: Int
    let competitionID: Int?
    let countryCode: String?
    let timeZone: TimeZone?
    let openDate: Date?
    let isVideoAvailable: Bool?
    let isInPlay: Bool
    let canTurnInPlay: Bool

    init(id: Int, name: String? = nil, sportID: Int, competitionID: Int? = nil, countryCode: String? = nil,
         timeZone: TimeZone? = nil, openDate: Date? = nil, isVideoAvailable: Bool? = nil, isInPlay: Bool,
         canTurnInPlay: Bool) {
        self.id = id
        self.name = name
        self.sportID = sportID
        self.competitionID = competitionID
        self.countryCode = countryCode
        self.timeZone = timeZone
        self.openDate = openDate
        self.isVideoAvailable = isVideoAvailable
        self.isInPlay = isInPlay
        self.canTurnInPlay = canTurnInPlay
    }

}

extension Event: Content { }
