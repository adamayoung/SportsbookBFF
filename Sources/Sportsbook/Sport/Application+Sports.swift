import Vapor

extension Application {

    public var sportServices: SportServices {
        .init(application: self)
    }

    public struct SportServices {
        final class Storage {
            var make: ((Request) -> SportService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (SportService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SportService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SportServices not configured. Configure with app.sportServices.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    public var sports: SportService {
        application.sportServices.make(self)
    }

}
