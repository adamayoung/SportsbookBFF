import Foundation
import SCAN
import Sportsbook

extension Sportsbook.MarketRunnerResult {

    init(result: SCAN.RunnerAttachment.RunnerResult) {
        let type = Sportsbook.MarketRunnerResult.ResultType(type: result.type)
        self.init(type: type)
    }

}

extension Sportsbook.MarketRunnerResult.ResultType {

    init?(type: SCAN.RunnerAttachment.RunnerResult.RunnerResultType?) {
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
