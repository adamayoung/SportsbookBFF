import Foundation
import SCAN
import Sportsbook

extension Sportsbook.MarketRunner {

    init?(runner: SCAN.RunnerAttachment) {
        guard
            let status = Sportsbook.MarketRunner.Status(status: runner.runnerStatus),
            status != .removed,
            let runnerResult = runner.result
        else {
            return nil
        }

        let result = Sportsbook.MarketRunnerResult(result: runnerResult)

        self.init(selectionID: runner.selectionId, name: runner.runnerName, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension Sportsbook.MarketRunner.Status {

    init?(status: SCAN.RunnerAttachment.Status) {
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
