import Vapor

struct EventProviderFactory {

    var make: ((Request) -> EventProvider)?

    mutating func use(_ make: @escaping ((Request) -> EventProvider)) {
        self.make = make
    }

}

extension Application {

    private struct EventProviderKey: StorageKey {
        typealias Value = EventProviderFactory
    }

    var eventsFactory: EventProviderFactory {
        get {
            self.storage[EventProviderKey.self] ?? .init()
        }
        set {
            self.storage[EventProviderKey.self] = newValue
        }
    }

}
