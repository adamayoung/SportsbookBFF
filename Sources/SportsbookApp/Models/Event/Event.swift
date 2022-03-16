import Foundation

struct Event: Identifiable, Equatable, Hashable, Comparable {

    let id: Int
    let name: String
    let sportID: Sport.ID
    let competitionID: Competition.ID?
    let countryCode: String?
    let timeZone: String?
    let openDate: Date?
    let isVideoAvailable: Bool?
    let isInPlay: Bool
    let canTurnInPlay: Bool

    init(id: Int, name: String, sportID: Sport.ID, competitionID: Competition.ID? = nil, countryCode: String? = nil,
         timeZone: String? = nil, openDate: Date?, isVideoAvailable: Bool? = nil, isInPlay: Bool, canTurnInPlay: Bool) {
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

    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
