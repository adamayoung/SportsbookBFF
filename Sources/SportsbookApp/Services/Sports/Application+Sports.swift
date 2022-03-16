import Vapor

extension Application {

    var sportProviders: SportProviders {
        .init(application: self)
    }

    struct SportProviders {
        final class Storage {
            var make: ((Request) -> SportProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        func use(_ make: @escaping (Request) -> (SportProvider)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> SportProvider {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("SportProviders not configured. Configure with app.sportProviders.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    var sports: SportProvider {
        application.sportProviders.make(self)
    }

}
