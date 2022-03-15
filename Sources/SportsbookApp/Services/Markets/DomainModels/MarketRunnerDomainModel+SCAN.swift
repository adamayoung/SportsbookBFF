import Foundation
import SCAN

extension MarketRunnerDomainModel {

    init?(runner: RunnerAttachment) {
        guard
            let status = MarketRunnerDomainModel.Status(status: runner.runnerStatus),
            let runnerResult = runner.result
        else {
            return nil
        }

        let result = MarketRunnerResultDomainModel(result: runnerResult)

        self.init(selectionID: runner.selectionId, name: runner.runnerName, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension MarketRunnerDomainModel.Status {

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
