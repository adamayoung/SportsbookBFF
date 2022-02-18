import Vapor

public struct SportServiceFactory {

    public var make: ((Request) -> SportService)?

    public mutating func use(_ make: @escaping ((Request) -> SportService)) {
        self.make = make
    }

}
