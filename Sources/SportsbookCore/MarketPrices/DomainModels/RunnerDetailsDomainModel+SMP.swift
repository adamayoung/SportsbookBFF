import Foundation
import SMP

extension RunnerDetailsDomainModel {

    init(runnerDetails: RunnerDetails) {
        let status = RunnerDetailsDomainModel.Status(runnerStatus: runnerDetails.runnerStatus)
        let winOdds = OddsDomainModel(odds: runnerDetails.winRunnerOdds)
        let eachwayOdds = OddsDomainModel(odds: runnerDetails.eachwayRunnerOdds)
        let previousWinOdds = runnerDetails.previousWinRunnerOdds?.compactMap(OddsDomainModel.init)
        let priceOverlay = PriceOverlay(priceOverlay: runnerDetails.priceOverlay)
        let scope = RunnerDetailsDomainModel.Scope(runnerScope: runnerDetails.runnerScope)

        self.init(selectionID: runnerDetails.selectionId, order: runnerDetails.runnerOrder, winOdds: winOdds,
                  eachwayOdds: eachwayOdds, previousWinOdds: previousWinOdds, handicap: runnerDetails.handicap,
                  status: status, priceOverlay: priceOverlay, scope: scope)
    }

}

extension RunnerDetailsDomainModel.Status {

    init(runnerStatus: RunnerDetails.RunnerStatus) {
        switch runnerStatus {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        case .unknown: self = .unknown
        }
    }

}

extension RunnerDetailsDomainModel.PriceOverlay {

    init?(priceOverlay: RunnerDetails.PriceOverlay?) {
        guard let priceOverlay = priceOverlay else {
            return nil
        }

        switch priceOverlay {
        case .enhancedPricePromotion:
            self = .enhancedPricePromotion

        case .unknown:
            self = .unknown
        }
    }

}

extension RunnerDetailsDomainModel.Scope {

    init?(runnerScope: RunnerDetails.RunnerScope?) {
        guard let runnerScope = runnerScope else {
            return nil
        }

        switch runnerScope {
        case .preplay: self = .prePlay
        case .inplay: self = .inPlay
        case .all: self = .all
        case .unknown: self = .unknown
        }
    }

}
