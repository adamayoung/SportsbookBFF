import Foundation
import SportsbookCore

extension Opportunity {

    init(opportunity: SportsbookCore.OpportunityDomainModel) {
        self.init(betReference: opportunity.betReference, promotionType: opportunity.promotionType)
    }

}
