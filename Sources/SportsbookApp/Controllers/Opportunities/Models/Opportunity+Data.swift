import Sportsbook
import Vapor

extension Opportunity {

    static func all(on request: Request) async throws -> [Opportunity] {
        let params = OpportunitiesParams(
            betLegs: [
                OpportunitiesParams.BetLeg(
                    runners: [
                        OpportunitiesParams.BetLeg.Runner(
                            marketID: "754.5225949",
                            selectionID: 8316613
                        )
                    ]
                )
            ],
            currency: "GBP",
            locale: .default
        )

        return try await request.opportunityService.fetchOpportunities(with: params)
            .map(Opportunity.init)
    }

}
