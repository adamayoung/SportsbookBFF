import SportsCMSCore
import Vapor

struct SportsCMS: SportsCMSProvider {

    private let configuration: CMSConfiguration
    private let client: CMSClientProvider
    private let logger: Logger

    init(configuration: CMSConfiguration, client: CMSClientProvider, logger: Logger) {
        self.configuration = configuration
        self.client = client
        self.logger = logger
    }

    func nodes(withTag tag: Tag, liveAtDate: Date = Date(),
               ofType type: CMSNode.CMSNodeType?) async throws -> [CMSNode] {
        logger.debug("Fetching nodes from CMS service",
                     metadata: [
                        "tag": .stringConvertible(tag),
                        "liveAtDate": .stringConvertible(liveAtDate)
                     ]
        )

        let dateFormatter = ISO8601DateFormatter()
        let path = "/nodes?tag=\(tag)&live-at-date=\(dateFormatter.string(from: liveAtDate))"
        var nodes: [CMSNode] = try await client.get(path, configuration: configuration)
        if let type = type {
            nodes = nodes.filter { $0.type == type }
        }

        return nodes
            .sorted { $0.name > $1.name }
            .sorted { $0.weight ?? 0 > $1.weight ?? 0 }
    }

}
