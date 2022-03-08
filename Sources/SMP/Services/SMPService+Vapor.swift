import GBPCore
import Vapor

extension Application {

    private struct SMPServiceKey: StorageKey {
        typealias Value = SMPServiceFactory
    }

    /// GBP's `SMPService` factory.
    public var smpService: SMPServiceFactory {
        get {
            self.storage[SMPServiceKey.self] ?? .init()
        }
        set {
            self.storage[SMPServiceKey.self] = newValue
        }
    }

}

extension Request {

    /// Sportsbook Market Prices service.
    public var smpService: SMPService {
        self.application.smpService.make!(self)
    }

}
