import Vapor

extension Application {

    private struct MarketPriceServiceKey: StorageKey {
        typealias Value = MarketPriceServiceFactory
    }

    public var marketPriceService: MarketPriceServiceFactory {
        get {
            self.storage[MarketPriceServiceKey.self] ?? .init()
        }
        set {
            self.storage[MarketPriceServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var marketPriceService: MarketPriceService {
        self.application.marketPriceService.make!(self)
    }

}
