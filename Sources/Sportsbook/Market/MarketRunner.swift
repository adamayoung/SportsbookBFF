import Foundation

public struct MarketRunner: Identifiable, Equatable, Hashable {

    public var id: Int { selectionID }
    public let selectionID: Int
    public let name: String
    public let handicap: Double
    public let sortPriority: Int
    public let status: MarketRunner.Status
    public let result: MarketRunnerResult

    public init(selectionID: Int, name: String, handicap: Double, sortPriority: Int, status: MarketRunner.Status,
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

    public enum Status: CaseIterable {
        case active
        case winner
        case loser
        case removeVacant
        case removed
    }

}
