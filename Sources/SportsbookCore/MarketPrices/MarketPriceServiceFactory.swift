import Vapor

public struct MarketPriceServiceFactory {

    public var make: ((Request) -> MarketPriceService)?

    public mutating func use(_ make: @escaping ((Request) -> MarketPriceService)) {
        self.make = make
    }

}
