import Vapor

extension Application {

    private struct EventServiceKey: StorageKey {
        typealias Value = EventServiceFactory
    }

    public var eventService: EventServiceFactory {
        get {
            self.storage[EventServiceKey.self] ?? .init()
        }
        set {
            self.storage[EventServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var eventService: EventService {
        self.application.eventService.make!(self)
    }

}
