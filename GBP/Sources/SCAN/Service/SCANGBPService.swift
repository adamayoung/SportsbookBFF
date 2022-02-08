import Foundation
import GBPCore
import Logging

struct SCANGBPService: SCANService {

    private static let searchPath = "/www/sports/navigation/facet/v1.0/search"

    private let configuration: SCANConfiguration
    private let client: GBPClient
    private let logger: Logger

    init(configuration: SCANConfiguration, client: GBPClient, logger: Logger) {
        self.configuration = configuration
        self.client = client
        self.logger = logger
    }

    func search(_ searchRequest: SearchRequest) async throws -> SearchResponse {
        logger.debug("Searching SCAN service", metadata: ["facets": .stringConvertible(searchRequest.facets)])

        return try await client.post(Self.searchPath, body: searchRequest, configuration: configuration)
    }

}
