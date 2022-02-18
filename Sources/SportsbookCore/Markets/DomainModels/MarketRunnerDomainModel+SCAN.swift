import Foundation
import SCAN

extension MarketRunnerDomainModel {

    init?(runner: Runner) {
        guard let status = MarketRunnerDomainModel.Status(status: runner.runnerStatus) else {
            return nil
        }

        let result = MarketRunnerResultDomainModel(result: runner.result)

        self.init(selectionID: runner.selectionId, name: runner.runnerName, handicap: runner.handicap,
                  sortPriority: runner.sortPriority, status: status, result: result)
    }

}

extension MarketRunnerDomainModel.Status {

    init?(status: Runner.RunnerStatus) {
        switch status {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        default:
            return nil
        }
    }

}
