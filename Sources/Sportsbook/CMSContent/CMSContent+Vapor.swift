import SportsCMS
import Vapor

public extension Application {

    private struct CMSContentServiceKey: StorageKey {
        typealias Value = CMSContentServiceFactory
    }

    var cmsContentService: CMSContentServiceFactory {
        get {
            self.storage[CMSContentServiceKey.self] ?? .init()
        }
        set {
            self.storage[CMSContentServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var cmsContentService: CMSContentService {
        self.application.cmsContentService.make!(self)
    }

}
