import Vapor

public extension Application {

    private struct MarketPriceServiceKey: StorageKey {
        typealias Value = MarketPriceServiceFactory
    }

    var marketPriceService: MarketPriceServiceFactory {
        get {
            self.storage[MarketPriceServiceKey.self] ?? .init()
        }
        set {
            self.storage[MarketPriceServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var marketPriceService: MarketPriceService {
        self.application.marketPriceService.make!(self)
    }

}
