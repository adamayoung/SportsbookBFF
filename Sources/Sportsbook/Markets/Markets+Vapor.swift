import GBP
import Vapor

public extension Application {

    private struct MarketServiceKey: StorageKey {
        typealias Value = MarketServiceFactory
    }

    var marketService: MarketServiceFactory {
        get {
            self.storage[MarketServiceKey.self] ?? .init()
        }
        set {
            self.storage[MarketServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var marketService: MarketService {
        self.application.marketService.make!(self)
    }

}
