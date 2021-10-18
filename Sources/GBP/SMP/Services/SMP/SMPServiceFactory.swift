import Vapor

public struct SMPServiceFactory {

    public var make: ((Request) -> SMPService)?

    public mutating func use(_ make: @escaping ((Request) -> SMPService)) {
        self.make = make
    }

}
