import Vapor

public struct FBRServiceFactory {

    public var make: ((Request) -> FBRService)?

    public mutating func use(_ make: @escaping ((Request) -> FBRService)) {
        self.make = make
    }

}
