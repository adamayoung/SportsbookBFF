import GBPCore
import Vapor

public extension Application {

    private struct SIBServiceKey: StorageKey {
        typealias Value = SIBServiceFactory
    }

    var sibService: SIBServiceFactory {
        get {
            self.storage[SIBServiceKey.self] ?? .init()
        }
        set {
            self.storage[SIBServiceKey.self] = newValue
        }
    }

}

public extension Request {

    /// Sportsbook Imply Bets service.
    var sibService: SIBService {
        self.application.sibService.make!(self)
    }

}
