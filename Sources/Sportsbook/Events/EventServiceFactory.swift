import Vapor

public struct EventServiceFactory {

    public var make: ((Request) -> EventService)?

    public mutating func use(_ make: @escaping ((Request) -> EventService)) {
        self.make = make
    }

}
