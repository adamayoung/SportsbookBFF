import SportsCMS
import Vapor

extension Application {

    private struct CMSContentServiceKey: StorageKey {
        typealias Value = CMSContentServiceFactory
    }

    public var cmsContentService: CMSContentServiceFactory {
        get {
            self.storage[CMSContentServiceKey.self] ?? .init()
        }
        set {
            self.storage[CMSContentServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var cmsContentService: CMSContentService {
        self.application.cmsContentService.make!(self)
    }

}
