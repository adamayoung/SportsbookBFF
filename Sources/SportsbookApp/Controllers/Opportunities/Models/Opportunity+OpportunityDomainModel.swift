import Foundation
import Sportsbook

extension Opportunity {

    init(opportunity: Sportsbook.OpportunityDomainModel) {
        self.init(betReference: opportunity.betReference, promotionType: opportunity.promotionType)
    }

}
