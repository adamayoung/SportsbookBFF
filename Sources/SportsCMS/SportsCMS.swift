import SportsCMSCore
import Vapor

struct SportsCMS: SportsCMSProvider {

    private let application: Application
    private var client: CMSClientProvider { application.cmsClient }
    private var logger: Logger { application.logger }

    init(application: Application) {
        self.application = application
    }

    func nodes(withTag tag: Tag, liveAtDate: Date = Date(),
               ofType type: CMSNode.CMSNodeType?) async throws -> [CMSNode] {
        guard let configuration = self.configuration else {
            fatalError("SportsCMS not configured. Use app.sportsCMS.configuration = ...")
        }

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

extension SportsCMS {

    struct ConfigurationKey: StorageKey {
        typealias Value = CMSConfiguration
    }

    public var configuration: CMSConfiguration? {
        get {
            application.storage[ConfigurationKey.self]
        }

        nonmutating set {
            application.storage[ConfigurationKey.self] = newValue
        }
    }

}

extension Application {

    public var sportsCMS: SportsCMSProvider {
        SportsCMS(application: self)
    }

}

extension Request {

    public var sportsCMS: SportsCMSProvider {
        SportsCMS(application: application)
    }

}
