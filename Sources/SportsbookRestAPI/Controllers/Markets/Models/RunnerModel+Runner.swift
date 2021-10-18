import Foundation
import Sportsbook

extension RunnerModel {

    init(runner: Runner) {
        let status = RunnerStatus(status: runner.status)
        let result = RunnerResult(result: runner.result)

        self.init(selectionID: runner.selectionID, name: runner.name, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension RunnerModel.RunnerStatus {

    init(status: Runner.RunnerStatus) {
        switch status {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        case .unknown: self = .unknown
        }
    }

}

extension RunnerModel.RunnerResult {

    init?(result: Runner.RunnerResult?) {
        guard let result = result else {
            return nil
        }

        let type = RunnerResultType(type: result.type)

        self.init(type: type)
    }

}

extension RunnerModel.RunnerResult.RunnerResultType {

    init?(type: Runner.RunnerResult.RunnerResultType?) {
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
