import Vapor

struct MarketModel: Equatable, Content {

    let id: String
    let name: String
    let marketDate: Date
    let inPlay: Bool
    let canTurnInPlay: Bool
    let marketType: String
    let runners: [RunnerModel]
    let eventTypeID: Int
    let eventID: Int
    let competitionID: Int

}
