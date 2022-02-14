import Foundation
import SportsbookCore

extension Runner {

    init(runner: SportsbookCore.MarketRunnerDomainModel) {
        let status = RunnerStatus(status: runner.status)
        let result = RunnerResult(result: runner.result)

        self.init(selectionID: runner.selectionID, name: runner.name, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension Runner.RunnerStatus {

    init(status: SportsbookCore.MarketRunnerDomainModel.Status) {
        switch status {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        case .unknown: self = .unknown
        }
    }

}

extension Runner.RunnerResult {

    init?(result: SportsbookCore.MarketRunnerResultDomainModel?) {
        guard let type = RunnerResultType(type: result?.type) else {
            return nil
        }

        self.init(type: type)
    }

}

extension Runner.RunnerResult.RunnerResultType {

    init?(type: SportsbookCore.MarketRunnerResultDomainModel.ResultType?) {
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
        case .unknown: self = .unknown
        }
    }

}
