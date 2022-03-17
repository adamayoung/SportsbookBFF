import Vapor

extension Application {

    public var marketPriceServices: MarketPriceServices {
        .init(application: self)
    }

    public struct MarketPriceServices {
        final class Storage {
            var make: ((Request) -> MarketPriceService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (MarketPriceService)) {
            storage.make = make
        }

        func make(_ request: Request) -> MarketPriceService {
            guard let make = storage.make else {
                fatalError("MarketPriceServices not configured. Configure with app.marketPriceServices.use(...)")
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

    public var marketPrices: MarketPriceService {
        application.marketPriceServices.make(self)
    }

}
