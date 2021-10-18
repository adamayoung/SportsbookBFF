import Vapor

public extension Application {

    private struct SCANServiceKey: StorageKey {
        typealias Value = SCANServiceFactory
    }

    var scanService: SCANServiceFactory {
        get {
            self.storage[SCANServiceKey.self] ?? .init()
        }
        set {
            self.storage[SCANServiceKey.self] = newValue
        }
    }

}

public extension Request {

    /// Sports Catalogue Navigator service.
    var scanService: SCANService {
        self.application.scanService.make!(self)
    }

}

extension Request {

    var scanConfiguration: SCANConfiguration {
        SCANConfiguration(environment: self.tlaEnvironment, key: self.tlaKey)
    }

    var scanCache: SCANCache {
        SCANVaporCache(cache: self.application.caches.memory, eventLoop: self.eventLoop, logger: self.logger)
    }

}
