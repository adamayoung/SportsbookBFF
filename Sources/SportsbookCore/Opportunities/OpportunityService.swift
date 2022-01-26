import Foundation

public protocol OpportunityService {

    func fetchOpportunities(with params: OpportunitiesParams) async throws -> [OpportunityDomainModel]

}
