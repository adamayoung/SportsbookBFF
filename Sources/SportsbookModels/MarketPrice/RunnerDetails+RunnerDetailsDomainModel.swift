import Foundation
import SportsbookCore

extension RunnerDetails {

    init(runnerDetails: RunnerDetailsDomainModel) {
        let winOdds = Odds(odds: runnerDetails.winOdds)
        let eachwayOdds = Odds(odds: runnerDetails.eachwayOdds)
        let previousWinOdds = runnerDetails.previousWinOdds?.compactMap(Odds.init)
        let handicap: Double? = {
            guard let handicap = runnerDetails.handicap as NSNumber? else {
                return nil
            }

            return Double(truncating: handicap)
        }()
        let status = RunnerDetails.Status(runnerStatus: runnerDetails.status)
        let priceOverlay = PriceOverlay(priceOverlay: runnerDetails.priceOverlay)
        let scope = RunnerDetails.Scope(runnerScope: runnerDetails.scope)

        self = RunnerDetails(selectionID: runnerDetails.selectionID, order: runnerDetails.order, winOdds: winOdds,
                             eachwayOdds: eachwayOdds, previousWinOdds: previousWinOdds, handicap: handicap,
                             status: status, priceOverlay: priceOverlay, scope: scope)
    }

}

extension RunnerDetails.Status {

    init(runnerStatus: RunnerDetailsDomainModel.Status) {
        switch runnerStatus {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        case .unknown: self = .unknown
        }
    }

}

extension RunnerDetails.PriceOverlay {

    init?(priceOverlay: RunnerDetailsDomainModel.PriceOverlay?) {
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

extension RunnerDetails.Scope {

    init?(runnerScope: RunnerDetailsDomainModel.Scope?) {
        guard let runnerScope = runnerScope else {
            return nil
        }

        switch runnerScope {
        case .prePlay: self = .prePlay
        case .inPlay: self = .inPlay
        case .all: self = .all
        case .unknown: self = .unknown
        }
    }

}
