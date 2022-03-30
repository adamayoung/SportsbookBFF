import Foundation

public struct Market: Identifiable, Equatable, Hashable, Comparable {

    public let id: String
    public let name: String
    public let marketDate: Date
    public let inPlay: Bool
    public let canTurnInPlay: Bool
    public let marketType: MarketType
    public let runners: [MarketRunner]
    public let sportID: Sport.ID
    public let eventID: Event.ID
    public let competitionID: Competition.ID

    public init(id: String, name: String, marketDate: Date, inPlay: Bool, canTurnInPlay: Bool, marketType: MarketType,
                runners: [MarketRunner], sportID: Sport.ID, eventID: Event.ID, competitionID: Competition.ID) {
        self.id = id
        self.name = name
        self.marketDate = marketDate
        self.inPlay = inPlay
        self.canTurnInPlay = canTurnInPlay
        self.marketType = marketType
        self.runners = runners
        self.sportID = sportID
        self.eventID = eventID
        self.competitionID = competitionID
    }

    public static func < (lhs: Market, rhs: Market) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}
