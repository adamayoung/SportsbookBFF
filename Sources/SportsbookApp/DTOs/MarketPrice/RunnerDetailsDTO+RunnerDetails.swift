import Foundation
import Sportsbook

extension RunnerDetailsDTO {

    init(runnerDetails: RunnerDetails) {
        let winOdds = OddsDTO(odds: runnerDetails.winOdds)
        let eachwayOdds = OddsDTO(odds: runnerDetails.eachwayOdds)
        let previousWinOdds = runnerDetails.previousWinOdds?.compactMap(OddsDTO.init)
        let handicap: Double? = {
            guard let handicap = runnerDetails.handicap as NSNumber? else {
                return nil
            }

            return Double(truncating: handicap)
        }()
        let status = RunnerDetailsDTO.Status(runnerStatus: runnerDetails.status)
        let priceOverlay = PriceOverlay(priceOverlay: runnerDetails.priceOverlay)
        let scope = RunnerDetailsDTO.Scope(runnerScope: runnerDetails.scope)

        self = RunnerDetailsDTO(selectionID: runnerDetails.selectionID, order: runnerDetails.order, winOdds: winOdds,
                             eachwayOdds: eachwayOdds, previousWinOdds: previousWinOdds, handicap: handicap,
                             status: status, priceOverlay: priceOverlay, scope: scope)
    }

}

extension RunnerDetailsDTO.Status {

    init(runnerStatus: RunnerDetails.Status) {
        switch runnerStatus {
        case .active: self = .active
        case .suspended: self = .suspended
        case .removed: self = .removed
        }
    }

}

extension RunnerDetailsDTO.PriceOverlay {

    init?(priceOverlay: RunnerDetails.PriceOverlay?) {
        guard let priceOverlay = priceOverlay else {
            return nil
        }

        switch priceOverlay {
        case .enhancedPricePromotion:
            self = .enhancedPricePromotion
        }
    }

}

extension RunnerDetailsDTO.Scope {

    init?(runnerScope: RunnerDetails.Scope?) {
        guard let runnerScope = runnerScope else {
            return nil
        }

        switch runnerScope {
        case .prePlay: self = .prePlay
        case .inPlay: self = .inPlay
        case .all: self = .all
        }
    }

}
