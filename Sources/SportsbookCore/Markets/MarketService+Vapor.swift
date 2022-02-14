import Vapor

extension Application {

    private struct MarketServiceKey: StorageKey {
        typealias Value = MarketServiceFactory
    }

    public var marketService: MarketServiceFactory {
        get {
            self.storage[MarketServiceKey.self] ?? .init()
        }
        set {
            self.storage[MarketServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var marketService: MarketService {
        self.application.marketService.make!(self)
    }

}
