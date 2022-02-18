import Foundation

public struct EventDomainModel: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let sportID: Int
    public let competitionID: Int?
    public let countryCode: String?
    public let timeZone: String?
    public let openDate: Date?
    public let isVideoAvailable: Bool?
    public let isInPlay: Bool
    public let canTurnInPlay: Bool

    public init(id: Int, name: String, sportID: Int, competitionID: Int? = nil, countryCode: String? = nil,
                timeZone: String? = nil, openDate: Date?, isVideoAvailable: Bool? = nil, isInPlay: Bool,
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

    public static func < (lhs: EventDomainModel, rhs: EventDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
