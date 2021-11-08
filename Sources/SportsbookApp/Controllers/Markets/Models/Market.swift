import Foundation

struct Market: Identifiable, Equatable, Codable {

    let id: String
    let name: String
    let marketDate: Date
    let inPlay: Bool
    let canTurnInPlay: Bool
    let marketType: String
    let runners: [Runner]
    let eventTypeID: Int
    let eventID: Int
    let competitionID: Int

    init(id: String, name: String, marketDate: Date, inPlay: Bool, canTurnInPlay: Bool, marketType: String,
         runners: [Runner], eventTypeID: Int, eventID: Int, competitionID: Int) {
        self.id = id
        self.name = name
        self.marketDate = marketDate
        self.inPlay = inPlay
        self.canTurnInPlay = canTurnInPlay
        self.marketType = marketType
        self.runners = runners
        self.eventTypeID = eventTypeID
        self.eventID = eventID
        self.competitionID = competitionID
    }

}
