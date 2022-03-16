import Vapor

extension Application {

    var marketPriceProviders: MarketPriceProviders {
        .init(application: self)
    }

    struct MarketPriceProviders {
        final class Storage {
            var make: ((Request) -> MarketPriceProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        func use(_ make: @escaping (Request) -> (MarketPriceProvider)) {
            storage.make = make
        }

        func make(_ request: Request) -> MarketPriceProvider {
            guard let make = storage.make else {
                fatalError("MarketPriceProviders not configured. Configure with app.marketPriceProviders.use(...)")
            }

            return make(request)
        }

        var storage: Storage {
            if let storage = application.storage[Key.self] {
                return storage
            }

            let storage = Storage()
            application.storage[Key.self] = storage
            return storage
        }
    }

}

extension Request {

    var marketPrices: MarketPriceProvider {
        application.marketPriceProviders.make(self)
    }

}
