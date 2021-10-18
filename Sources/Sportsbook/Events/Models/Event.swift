import Foundation

public struct Event: Identifiable, Equatable, Hashable, Codable {

    public let id: Int
    public let name: String?
    public let eventTypeID: Int
    public let competitionID: Int?
    public let countryCode: String?
    public let timeZone: String?
    public let openDate: Date?
    public let isVideoAvailable: Bool?
    public let isInPlay: Bool
    public let canTurnInPlay: Bool

    public init(id: Int, name: String? = nil, eventTypeID: Int, competitionID: Int? = nil, countryCode: String? = nil,
                timeZone: String? = nil, openDate: Date?, isVideoAvailable: Bool? = nil, isInPlay: Bool,
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
