import Foundation

struct MarketRunner: Identifiable, Equatable, Hashable {

    var id: Int { selectionID }
    let selectionID: Int
    let name: String
    let handicap: Double
    let sortPriority: Int
    let status: MarketRunner.Status
    let result: MarketRunnerResult

    init(selectionID: Int, name: String, handicap: Double, sortPriority: Int, status: MarketRunner.Status,
         result: MarketRunnerResult) {
        self.selectionID = selectionID
        self.handicap = handicap
        self.name = name
        self.sortPriority = sortPriority
        self.status = status
        self.result = result
    }

}

extension MarketRunner {

    enum Status: CaseIterable {
        case active
        case winner
        case loser
        case removeVacant
        case removed
    }

}
