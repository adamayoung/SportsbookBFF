import Vapor

struct MarketProviderFactory {

    var make: ((Request) -> MarketProvider)?

    mutating func use(_ make: @escaping ((Request) -> MarketProvider)) {
        self.make = make
    }

}

extension Application {

    private struct MarketProviderKey: StorageKey {
        typealias Value = MarketProviderFactory
    }

    var marketsFactory: MarketProviderFactory {
        get {
            self.storage[MarketProviderKey.self] ?? .init()
        }
        set {
            self.storage[MarketProviderKey.self] = newValue
        }
    }

}
