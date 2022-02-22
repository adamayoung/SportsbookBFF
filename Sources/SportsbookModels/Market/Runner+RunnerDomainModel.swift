import Foundation
import SportsbookCore

extension Runner {

    init(runner: MarketRunnerDomainModel) {
        let status = RunnerStatus(status: runner.status)
        let result = RunnerResult(result: runner.result)

        self.init(selectionID: runner.selectionID, name: runner.name, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension Runner.RunnerStatus {

    init(status: MarketRunnerDomainModel.Status) {
        switch status {
        case .active: self = .active
        case .winner: self = .winner
        case .loser: self = .loser
        case .removeVacant: self = .removeVacant
        case .removed: self = .removed
        }
    }

}

extension Runner.RunnerResult {

    init?(result: MarketRunnerResultDomainModel?) {
        guard let type = RunnerResultType(type: result?.type) else {
            return nil
        }

        self.init(type: type)
    }

}

extension Runner.RunnerResult.RunnerResultType {

    init?(type: MarketRunnerResultDomainModel.ResultType?) {
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
