import Vapor

public struct NodeServiceFactory {

    public var make: ((Request) -> NodeService)?

    public mutating func use(_ make: @escaping ((Request) -> NodeService)) {
        self.make = make
    }

}
