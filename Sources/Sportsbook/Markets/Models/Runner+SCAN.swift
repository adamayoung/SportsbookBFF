import Foundation
import GBP

extension Runner {

    init(runner: GBP.Runner) {
        let status = RunnerStatus(status: runner.runnerStatus)
        let result = RunnerResult(result: runner.result)

        self.init(selectionID: runner.selectionId, name: runner.runnerName, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension Runner.RunnerStatus {

    init(status: GBP.Runner.RunnerStatus) {
        switch status {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        case .unknown: self = .unknown
        }
    }

}

extension Runner.RunnerResult {

    init(result: GBP.Runner.RunnerResult) {
        let type = RunnerResultType(type: result.type)
        self.init(type: type)
    }

}

extension Runner.RunnerResult.RunnerResultType {

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
