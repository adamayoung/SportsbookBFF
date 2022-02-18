import Foundation

public struct Market: Identifiable, Equatable, Codable {

    public let id: String
    public let name: String
    public let marketDate: Date
    public let inPlay: Bool
    public let canTurnInPlay: Bool
    public let marketType: String
    public let runners: [Runner]
    public let sportID: Int
    public let eventID: Int
    public let competitionID: Int

    public init(id: String, name: String, marketDate: Date, inPlay: Bool, canTurnInPlay: Bool, marketType: String,
                runners: [Runner], sportID: Int, eventID: Int, competitionID: Int) {
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

}
