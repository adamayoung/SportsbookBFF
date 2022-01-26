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

    func fetchFeatured() async throws -> [CMSNodeDomainModel] {
        try await fetchNodes(withTag: .featured)
    }

    func fetchPopular() async throws -> [CMSNodeDomainModel] {
        try await fetchNodes(withTag: .popular)
    }

}

extension CMSContentSportsCMSService {

    private func fetchNodes(withTag tag: Tag) async throws -> [CMSNodeDomainModel] {
        try await cmsNodeService.fetchNodes(withTag: tag)
            .compactMap(CMSNodeDomainModel.init(node:))
            .filter(\.isSupported)
            .sorted { $0.name > $1.name }
            .sorted { $0.weight > $1.weight }
    }

}
