import Vapor

public struct GBPClientFactory {

    public var make: ((Request) -> GBPClient)?

    public mutating func use(_ make: @escaping ((Request) -> GBPClient)) {
        self.make = make
    }

}
