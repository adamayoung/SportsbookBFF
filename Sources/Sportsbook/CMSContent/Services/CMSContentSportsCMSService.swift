import Foundation
import Logging
import NIO
import SportsCMS

struct CMSContentSportsCMSService: CMSContentService {

    private let cmsNodeService: NodeService
    private let eventLoop: EventLoop
    private let logger: Logger

    init(cmsNodeService: NodeService, eventLoop: EventLoop, logger: Logger) {
        self.cmsNodeService = cmsNodeService
        self.eventLoop = eventLoop
        self.logger = logger
    }

    func fetchFeatured() -> EventLoopFuture<[CMSNodeDomainModel]> {
        fetchNodes(withTag: .featured)
    }

    func fetchPopular() -> EventLoopFuture<[CMSNodeDomainModel]> {
        fetchNodes(withTag: .popular)
    }

}

extension CMSContentSportsCMSService {

    private func fetchNodes(withTag tag: Tag) -> EventLoopFuture<[CMSNodeDomainModel]> {
        cmsNodeService.fetchNodes(withTag: tag)
            .mapEachCompact(CMSNodeDomainModel.init)
            .map { $0.filter(\.isSupported) }
            .map { $0.sorted { $0.name > $1.name } }
            .map { $0.sorted { $0.weight > $1.weight } }
    }

}
