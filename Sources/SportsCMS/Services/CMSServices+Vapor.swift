import Vapor

public extension Application {

    private struct NodeServiceKey: StorageKey {
        typealias Value = NodeServiceFactory
    }

    var cmsNodeService: NodeServiceFactory {
        get {
            self.storage[NodeServiceKey.self] ?? .init()
        }
        set {
            self.storage[NodeServiceKey.self] = newValue
        }
    }

}

public extension Request {

    /// CMS Node service.
    var cmsNodeService: NodeService {
        self.application.cmsNodeService.make!(self)
    }

}
