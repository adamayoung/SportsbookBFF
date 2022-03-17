import Foundation
import SMP
import Sportsbook

extension Sportsbook.RunnerDetails {

    init?(runnerDetails: SMP.RunnerDetails) {
        guard let status = RunnerDetails.Status(runnerStatus: runnerDetails.runnerStatus) else {
            return nil
        }

        let winOdds = Sportsbook.Odds(odds: runnerDetails.winRunnerOdds)
        let eachwayOdds = Sportsbook.Odds(odds: runnerDetails.eachwayRunnerOdds)
        let previousWinOdds = runnerDetails.previousWinRunnerOdds?.compactMap(Odds.init)
        let priceOverlay = Sportsbook.RunnerDetails.PriceOverlay(priceOverlay: runnerDetails.priceOverlay)
        let scope = Sportsbook.RunnerDetails.Scope(runnerScope: runnerDetails.runnerScope)

        self.init(selectionID: runnerDetails.selectionId, order: runnerDetails.runnerOrder, winOdds: winOdds,
                  eachwayOdds: eachwayOdds, previousWinOdds: previousWinOdds, handicap: runnerDetails.handicap,
                  status: status, priceOverlay: priceOverlay, scope: scope)
    }

}

extension Sportsbook.RunnerDetails.Status {

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

extension Sportsbook.RunnerDetails.PriceOverlay {

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

extension Sportsbook.RunnerDetails.Scope {

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
