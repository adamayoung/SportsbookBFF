import Vapor

public struct SIBServiceFactory {

    public var make: ((Request) -> SIBService)?

    public mutating func use(_ make: @escaping ((Request) -> SIBService)) {
        self.make = make
    }

}
