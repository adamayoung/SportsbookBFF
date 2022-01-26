import Foundation

public struct MarketRunnerDomainModel: Identifiable, Equatable, Hashable {

    public var id: Int { selectionID }
    public let selectionID: Int
    public let name: String
    public let handicap: Double
    public let sortPriority: Int
    public let status: MarketRunnerDomainModel.Status
    public let result: MarketRunnerResultDomainModel

    public init(selectionID: Int, name: String, handicap: Double, sortPriority: Int,
                status: MarketRunnerDomainModel.Status, result: MarketRunnerResultDomainModel) {
        self.selectionID = selectionID
        self.handicap = handicap
        self.name = name
        self.sortPriority = sortPriority
        self.status = status
        self.result = result
    }

}

extension MarketRunnerDomainModel {

    public enum Status: CaseIterable {
        case active
        case suspended
        case removed
        case unknown
    }

}
