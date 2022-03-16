import Vapor

extension Application {

    var marketProviders: MarketProviders {
        .init(application: self)
    }

    struct MarketProviders {
        final class Storage {
            var make: ((Request) -> MarketProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        func use(_ make: @escaping (Request) -> (MarketProvider)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> MarketProvider {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("MarketProviders not configured. Configure with app.marketProviders.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    var markets: MarketProvider {
        application.marketProviders.make(self)
    }

}
