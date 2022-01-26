import Foundation
import SIB

extension OpportunitiesParams: ImplyBetsRequestRepresentable {

    public var implyBetsRequest: ImplyBetsRequest {
        ImplyBetsRequest(
            betLegs: self.betLegs.compactMap { betLeg in
                let runners = betLeg.runners.map { runner in
                    SIB.BetRunner(
                        runner: SIB.BetRunnerRunner(
                            marketId: runner.marketID,
                            selectionId: runner.selectionID,
                            handicap: runner.handicap
                        )
                    )
                }

                guard !runners.isEmpty else {
                    return nil
                }

                return SIB.BetLeg(betRunners: runners)
            },
            currency: self.currency,
            locale: self.locale
        )
    }

}
