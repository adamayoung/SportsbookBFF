import Foundation
import GBP

extension OpportunitiesParams: ImplyBetsRequestRepresentable {

    public var implyBetsRequest: ImplyBetsRequest {
        ImplyBetsRequest(
            betLegs: self.betLegs.compactMap { betLeg in
                let runners = betLeg.runners.map { runner in
                    GBP.BetRunner(
                        runner: GBP.BetRunnerRunner(
                            marketId: runner.marketID,
                            selectionId: runner.selectionID,
                            handicap: runner.handicap
                        )
                    )
                }

                guard !runners.isEmpty else {
                    return nil
                }

                return GBP.BetLeg(betRunners: runners)
            },
            currency: self.currency,
            locale: self.locale
        )
    }

}
