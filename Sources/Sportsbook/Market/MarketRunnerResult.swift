import Foundation

public struct MarketRunnerResult: Equatable, Hashable {

    public let type: MarketRunnerResult.ResultType?

    public init(type: MarketRunnerResult.ResultType? = nil) {
        self.type = type
    }

}

extension MarketRunnerResult {

    public enum ResultType: CaseIterable {
        case home
        case away
        case draw
        case over
        case under
        case line
        case score
        case noGoal
    }

}
