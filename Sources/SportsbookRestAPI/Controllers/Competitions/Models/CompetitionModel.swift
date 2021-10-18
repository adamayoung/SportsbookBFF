import Vapor

struct CompetitionModel: Equatable, Content {

    let id: Int
    let name: String
    let eventTypeID: Int

}
