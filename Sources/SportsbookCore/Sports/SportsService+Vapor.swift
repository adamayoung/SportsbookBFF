import Vapor

extension Application {

    private struct SportServiceKey: StorageKey {
        typealias Value = SportServiceFactory
    }

    public var sportService: SportServiceFactory {
        get {
            self.storage[SportServiceKey.self] ?? .init()
        }
        set {
            self.storage[SportServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var sportService: SportService {
        self.application.sportService.make!(self)
    }

}
