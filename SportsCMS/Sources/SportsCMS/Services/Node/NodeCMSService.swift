import SportsCMSCore
import Vapor

struct NodeCMSService: NodeService {

    private let configuration: CMSConfiguration
    private let client: CMSClient
    private let logger: Logger

    init(configuration: CMSConfiguration, client: CMSClient, logger: Logger) {
        self.configuration = configuration
        self.client = client
        self.logger = logger
    }

    func fetchNodes(withTag tag: Tag, liveAtDate: Date = Date()) async throws -> [CMSNode] {
        logger.debug("Fetching nodes from CMS service",
                     metadata: [
                        "tag": .stringConvertible(tag),
                        "liveAtDate": .stringConvertible(liveAtDate)
                     ]
        )

        let dateFormatter = ISO8601DateFormatter()
        let path = "/nodes?tag=\(tag)&live-at-date=\(dateFormatter.string(from: liveAtDate))"
        return try await client.get(path, configuration: configuration)
    }

}
