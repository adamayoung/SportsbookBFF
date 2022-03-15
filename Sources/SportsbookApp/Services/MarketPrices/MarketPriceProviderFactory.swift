import Vapor

struct MarketPriceProviderFactory {

    var make: ((Request) -> MarketPriceProvider)?

    mutating func use(_ make: @escaping ((Request) -> MarketPriceProvider)) {
        self.make = make
    }

}

extension Application {

    private struct MarketPriceServiceKey: StorageKey {
        typealias Value = MarketPriceProviderFactory
    }

    var marketPricesFactory: MarketPriceProviderFactory {
        get {
            self.storage[MarketPriceServiceKey.self] ?? .init()
        }
        set {
            self.storage[MarketPriceServiceKey.self] = newValue
        }
    }

}
