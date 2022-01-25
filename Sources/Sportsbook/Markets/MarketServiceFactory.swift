import Vapor

public struct MarketServiceFactory {

    public var make: ((Request) -> MarketService)?

    public mutating func use(_ make: @escaping ((Request) -> MarketService)) {
        self.make = make
    }

}
