import Foundation
import NIO

/// CMS Node service.
///
/// A node is a generic term for a: Sport, Competition, Event, Market Type or a Banner. Nodes can be "tagged" into lists. They can also have their own weights which means that e.g. Sports can be ordered amongst other Sports.
public protocol NodeService {

    func fetchNodes(withTag tag: Tag, liveAtDate: Date) -> EventLoopFuture<[CMSNode]>

}

public extension NodeService {

    func fetchNodes(withTag tag: Tag) -> EventLoopFuture<[CMSNode]> {
        fetchNodes(withTag: tag, liveAtDate: Date())
    }

}
