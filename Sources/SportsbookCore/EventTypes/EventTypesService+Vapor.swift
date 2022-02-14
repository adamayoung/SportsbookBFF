import Vapor

extension Application {

    private struct EventTypeServiceKey: StorageKey {
        typealias Value = EventTypeServiceFactory
    }

    public var eventTypeService: EventTypeServiceFactory {
        get {
            self.storage[EventTypeServiceKey.self] ?? .init()
        }
        set {
            self.storage[EventTypeServiceKey.self] = newValue
        }
    }

}

extension Request {

    public var eventTypeService: EventTypeService {
        self.application.eventTypeService.make!(self)
    }

}
