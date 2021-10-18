import Vapor

public struct SCANServiceFactory {

    public var make: ((Request) -> SCANService)?

    public mutating func use(_ make: @escaping ((Request) -> SCANService)) {
        self.make = make
    }

}
