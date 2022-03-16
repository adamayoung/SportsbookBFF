import Vapor

extension Application {

    var eventProviders: EventProviders {
        .init(application: self)
    }

    struct EventProviders {
        final class Storage {
            var make: ((Request) -> EventProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        func use(_ make: @escaping (Request) -> (EventProvider)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> EventProvider {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("EventProviders not configured. Configure with app.eventProviders.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    var events: EventProvider {
        application.eventProviders.make(self)
    }

}
