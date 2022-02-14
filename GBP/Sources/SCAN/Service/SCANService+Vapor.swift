import Vapor

extension Application {

    private struct SCANServiceKey: StorageKey {
        typealias Value = SCANServiceFactory
    }

    public var scanService: SCANServiceFactory {
        get {
            self.storage[SCANServiceKey.self] ?? .init()
        }
        set {
            self.storage[SCANServiceKey.self] = newValue
        }
    }

}

extension Request {

    /// Sports Catalogue Navigator service.
    public var scanService: SCANService {
        self.application.scanService.make!(self)
    }

}
