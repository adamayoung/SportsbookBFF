import Foundation
import SIB

extension OpportunityDomainModel {

    static func create(params: OpportunitiesParams, response: SIB.ImpyBetsResponse) -> [OpportunityDomainModel] {
//        let odds = (response.winRunnerOdds ?? []).reduce(into: [:]) { $0[$1.runner.id] = $1 }
//
//        let singles: [OpportunityDomainModel] = params.betLegs.map { betLeg in
//            if let betCombination = response.betCombinations.first { Self.isBetLeg(betLeg, correspondingTo: $0) } {
//                return 1
//            }
//
//            
//        }
//
//        const singles: Opportunity[] = opportunitiesParams.betLegs.map(betLeg => {
//            const betCombination = implyBetsResponse.betCombinations.find(isBetLegCorrespondingToCombination(betLeg))
//
//            if (betCombination) {
//              return extractSingleOpportunity(betCombination, indexedOdds, indexedRunnerFailures, indexedLegFailures)
//            } else {
//              const runnerFailures = betLeg
//                .runners
//                .map(runnerID)
//                .flatMap(runnerID => indexedRunnerFailures[runnerID] ?? [])
//              const legFailures = betLeg
//                .runners
//                .map(runnerID)
//                .flatMap(runnerID => indexedLegFailures[runnerID] ?? [])
//
//              const status: OpportunityStatus = _.isEmpty(runnerFailures) && _.isEmpty(legFailures) ? 'NOT_FOUND' : getOpportunityStatus(runnerFailures, legFailures)
//
//              return {
//                legInformation: createLegInformation(betLeg.runners),
//                status,
//                type: getOpportunityType(undefined)
//              }
//            }
//          })
//
//

        return []
    }

}

extension OpportunityDomainModel {

    private static func isBetLeg(_ betLeg: OpportunitiesParams.BetLeg,
                                 correspondingTo combination: BetCombination) -> Bool {
        let inputRunnerIDs = Set(betLeg.runners.map(\.id))
        let responseRunners = combination.legCombinations.first?.runners ?? []
        let responseRunnerIDs = Set(responseRunners.map(\.id))
        return inputRunnerIDs == responseRunnerIDs
    }

}
