import Vapor

public extension Application {

    private struct FBRServiceKey: StorageKey {
        typealias Value = FBRServiceFactory
    }

    var fbrService: FBRServiceFactory {
        get {
            self.storage[FBRServiceKey.self] ?? .init()
        }
        set {
            self.storage[FBRServiceKey.self] = newValue
        }
    }

}

public extension Request {

    /// Fixed Odds Bet Reporting  service.
    var fbrService: FBRService {
        self.application.fbrService.make!(self)
    }

}

extension Request {

    var fbrConfiguration: SCANConfiguration {
        SCANConfiguration(gbpConfiguration: self.gbpConfiguration)
    }

}
