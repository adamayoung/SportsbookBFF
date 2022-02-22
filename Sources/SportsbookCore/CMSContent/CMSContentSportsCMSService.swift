import Foundation
import Logging
import SportsCMS

struct CMSContentSportsCMSService: CMSContentService {

    private let cmsNodeService: NodeService
    private let logger: Logger

    init(cmsNodeService: NodeService, logger: Logger) {
        self.cmsNodeService = cmsNodeService
        self.logger = logger
    }

    func featured() async throws -> [CMSNodeDomainModel] {
        let nodes = try await nodes(withTag: .featured)
        return nodes
    }

    func popular() async throws -> [CMSNodeDomainModel] {
        let nodes = try await nodes(withTag: .popular)
        return nodes
    }

}

extension CMSContentSportsCMSService {

    private func nodes(withTag tag: Tag) async throws -> [CMSNodeDomainModel] {
        let nodes = try await cmsNodeService.fetchNodes(withTag: tag)
            .compactMap(CMSNodeDomainModel.init(node:))
            .filter(\.isSupported)
            .sorted { $0.name > $1.name }
            .sorted { $0.weight > $1.weight }
        return nodes
    }

}
