import Vapor

public extension Application {

    private struct EventServiceKey: StorageKey {
        typealias Value = EventServiceFactory
    }

    var eventService: EventServiceFactory {
        get {
            self.storage[EventServiceKey.self] ?? .init()
        }
        set {
            self.storage[EventServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var eventService: EventService {
        self.application.eventService.make!(self)
    }

}
