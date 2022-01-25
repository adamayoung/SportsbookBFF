import Foundation
import GBP
import Logging

final class OpportunitySIBService: OpportunityService {

    private let sibService: SIBService
    private let logger: Logger

    init(sibService: SIBService, logger: Logger) {
        self.sibService = sibService
        self.logger = logger
    }

    func fetchOpportunities(with params: OpportunitiesParams) async throws -> [OpportunityDomainModel] {
        logger.debug("Fetching Opportunities") //, metadata: ["id": .stringConvertible(id)])

        let response = try await sibService.implyBets(request: params)
        return OpportunityDomainModel.create(params: params, response: response)
    }

}
