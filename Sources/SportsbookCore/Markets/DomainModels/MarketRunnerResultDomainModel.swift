import Foundation

public struct MarketRunnerResultDomainModel: Equatable, Hashable {

    public let type: MarketRunnerResultDomainModel.ResultType?

    public init(type: MarketRunnerResultDomainModel.ResultType? = nil) {
        self.type = type
    }

}

extension MarketRunnerResultDomainModel {

    public enum ResultType: CaseIterable {
        case home
        case away
        case draw
        case over
        case under
        case line
        case score
        case noGoal
        case unknown
    }

}
