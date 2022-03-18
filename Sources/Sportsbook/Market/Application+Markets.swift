import Vapor

extension Application {

    public var marketServices: MarketServices {
        .init(application: self)
    }

    public struct MarketServices {
        final class Storage {
            var make: ((Request) -> MarketService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (MarketService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> MarketService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("MarketServices not configured. Configure with app.marketServices.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    public var markets: MarketService {
        application.marketServices.make(self)
    }

}
