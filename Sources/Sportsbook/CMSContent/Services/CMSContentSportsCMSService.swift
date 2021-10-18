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

    func fetchFeatured() -> EventLoopFuture<[CMSNode]> {
        cmsNodeService.fetchNodes(withTag: .featured)
            .mapEach(CMSNode.init)
    }

}
