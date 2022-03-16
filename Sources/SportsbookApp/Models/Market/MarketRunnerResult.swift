import Foundation

struct MarketRunnerResult: Equatable, Hashable {

    let type: MarketRunnerResult.ResultType?

    init(type: MarketRunnerResult.ResultType? = nil) {
        self.type = type
    }

}

extension MarketRunnerResult {

    enum ResultType: CaseIterable {
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
