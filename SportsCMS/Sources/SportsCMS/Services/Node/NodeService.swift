import Foundation

/// CMS Node service.
///
/// A node is a generic term for a: Sport, Competition, Event, Market Type or a Banner. Nodes can be "tagged" into lists. They can also have their own weights which means that e.g. Sports can be ordered amongst other Sports.
public protocol NodeService {

    func fetchNodes(withTag tag: Tag, liveAtDate: Date) async throws -> [CMSNode]

}

public extension NodeService {

    func fetchNodes(withTag tag: Tag) async throws -> [CMSNode] {
        try await fetchNodes(withTag: tag, liveAtDate: Date())
    }

}
