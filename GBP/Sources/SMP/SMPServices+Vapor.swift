import GBPCore
import Vapor

public extension Application {

    private struct SMPServiceKey: StorageKey {
        typealias Value = SMPServiceFactory
    }

    var smpService: SMPServiceFactory {
        get {
            self.storage[SMPServiceKey.self] ?? .init()
        }
        set {
            self.storage[SMPServiceKey.self] = newValue
        }
    }

}

public extension Request {

    /// Sportsbook Market Prices service.
    var smpService: SMPService {
        self.application.smpService.make!(self)
    }

}

extension Request {

    var smpConfiguration: SMPConfiguration {
        SMPConfiguration(gbpConfiguration: self.gbpConfiguration)
    }

}
