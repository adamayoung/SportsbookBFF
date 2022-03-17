import Vapor

extension Application {

    public var eventServices: EventServices {
        .init(application: self)
    }

    public struct EventServices {
        final class Storage {
            var make: ((Request) -> EventService)?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        let application: Application

        public func use(_ make: @escaping (Request) -> (EventService)) {
            if self.application.storage[Key.self] == nil {
                self.application.storage[Key.self] = .init()
            }

            self.application.storage[Key.self]?.make = make
        }

        func make(_ request: Request) -> EventService {
            guard let make = request.application.storage[Key.self]?.make else {
                fatalError("EventServices not configured. Configure with app.eventServices.use(...)")
            }

            return make(request)
        }
    }

}

extension Request {

    public var events: EventService {
        application.eventServices.make(self)
    }

}
