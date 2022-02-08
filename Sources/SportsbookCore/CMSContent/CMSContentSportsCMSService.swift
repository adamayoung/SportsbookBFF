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
        try await nodes(withTag: .featured)
    }

    func popular() async throws -> [CMSNodeDomainModel] {
        try await nodes(withTag: .popular)
    }

}

extension CMSContentSportsCMSService {

    private func nodes(withTag tag: Tag) async throws -> [CMSNodeDomainModel] {
        try await cmsNodeService.fetchNodes(withTag: tag)
            .compactMap(CMSNodeDomainModel.init(node:))
            .filter(\.isSupported)
            .sorted { $0.name > $1.name }
            .sorted { $0.weight > $1.weight }
    }

}
