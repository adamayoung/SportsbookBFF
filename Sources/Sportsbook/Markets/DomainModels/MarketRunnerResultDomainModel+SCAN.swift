import Foundation
import GBP

extension MarketRunnerResultDomainModel {

    init(result: GBP.Runner.RunnerResult) {
        let type = MarketRunnerResultDomainModel.ResultType(type: result.type)
        self.init(type: type)
    }

}

extension MarketRunnerResultDomainModel.ResultType {

    init?(type: GBP.Runner.RunnerResult.RunnerResultType?) {
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
        }
    }

}
