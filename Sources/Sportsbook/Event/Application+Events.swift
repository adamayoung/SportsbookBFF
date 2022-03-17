import Vapor

extension Application {

    public var eventProviders: EventProviders {
        .init(application: self)
    }

    public struct EventProviders {
        final class Storage {
            var make: ((Request) -> EventProvider)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (EventProvider)) {
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

    public var events: EventProvider {
        application.eventProviders.make(self)
    }

}
