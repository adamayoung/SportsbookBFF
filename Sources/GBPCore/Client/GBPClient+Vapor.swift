import Vapor

public extension Application {

    private struct GBPClientKey: StorageKey {
        typealias Value = GBPClientFactory
    }

    var gbpService: GBPClientFactory {
        get {
            self.storage[GBPClientKey.self] ?? .init()
        }
        set {
            self.storage[GBPClientKey.self] = newValue
        }
    }

}

public extension Request {

    /// GBP Client.
    var gbpClient: GBPClient {
        self.application.gbpService.make!(self)
    }

}
