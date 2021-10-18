import GBP
import Vapor

public extension Application {

    private struct EventTypeServiceKey: StorageKey {
        typealias Value = EventTypeServiceFactory
    }

    var eventTypeService: EventTypeServiceFactory {
        get {
            self.storage[EventTypeServiceKey.self] ?? .init()
        }
        set {
            self.storage[EventTypeServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var eventTypeService: EventTypeService {
        self.application.eventTypeService.make!(self)
    }

}
