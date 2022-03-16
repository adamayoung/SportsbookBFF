import Foundation
import SCAN

extension MarketRunner {

    init?(runner: RunnerAttachment) {
        guard
            let status = MarketRunner.Status(status: runner.runnerStatus),
            let runnerResult = runner.result
        else {
            return nil
        }

        let result = MarketRunnerResult(result: runnerResult)

        self.init(selectionID: runner.selectionId, name: runner.runnerName, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension MarketRunner.Status {

    init?(status: RunnerAttachment.Status) {
        switch status {
        case .active: self = .active
        case .winner: self = .winner
        case .loser: self = .loser
        case .removeVacant: self = .removeVacant
        case .removed: self = .removed
        default:
            return nil
        }
    }

}
