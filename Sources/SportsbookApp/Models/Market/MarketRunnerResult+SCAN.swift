import Foundation
import SCAN

extension MarketRunnerResult {

    init(result: RunnerAttachment.RunnerResult) {
        let type = MarketRunnerResult.ResultType(type: result.type)
        self.init(type: type)
    }

}

extension MarketRunnerResult.ResultType {

    init?(type: RunnerAttachment.RunnerResult.RunnerResultType?) {
        guard let type = type else {
            return nil
        }

        switch type {
        case .home: self = .home
        case .away: self = .away
        case .draw: self = .draw
        case .over: self = .over
        case .under: self = .under
        case .line: self = .line
        case .score: self = .score
        case .noGoal: self = .noGoal
        default:
            return nil
        }
    }

}
