import Vapor

public struct EventTypeServiceFactory {

    public var make: ((Request) -> EventTypeService)?

    public mutating func use(_ make: @escaping ((Request) -> EventTypeService)) {
        self.make = make
    }

}
