import Foundation
import SMP

extension RunnerDetails {

    init?(runnerDetails: SMP.RunnerDetails) {
        guard let status = RunnerDetails.Status(runnerStatus: runnerDetails.runnerStatus) else {
            return nil
        }

        let winOdds = Odds(odds: runnerDetails.winRunnerOdds)
        let eachwayOdds = Odds(odds: runnerDetails.eachwayRunnerOdds)
        let previousWinOdds = runnerDetails.previousWinRunnerOdds?.compactMap(Odds.init)
        let priceOverlay = PriceOverlay(priceOverlay: runnerDetails.priceOverlay)
        let scope = RunnerDetails.Scope(runnerScope: runnerDetails.runnerScope)

        self.init(selectionID: runnerDetails.selectionId, order: runnerDetails.runnerOrder, winOdds: winOdds,
                  eachwayOdds: eachwayOdds, previousWinOdds: previousWinOdds, handicap: runnerDetails.handicap,
                  status: status, priceOverlay: priceOverlay, scope: scope)
    }

}

extension RunnerDetails.Status {

    init?(runnerStatus: SMP.RunnerDetails.RunnerStatus) {
        switch runnerStatus {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        default:
            return nil
        }
    }

}

extension RunnerDetails.PriceOverlay {

    init?(priceOverlay: SMP.RunnerDetails.PriceOverlay?) {
        guard let priceOverlay = priceOverlay else {
            return nil
        }

        switch priceOverlay {
        case .enhancedPricePromotion: self = .enhancedPricePromotion
        default:
            return nil
        }
    }

}

extension RunnerDetails.Scope {

    init?(runnerScope: SMP.RunnerDetails.RunnerScope?) {
        guard let runnerScope = runnerScope else {
            return nil
        }

        switch runnerScope {
        case .preplay: self = .prePlay
        case .inplay: self = .inPlay
        case .all: self = .all
        default:
            return nil
        }
    }

}
