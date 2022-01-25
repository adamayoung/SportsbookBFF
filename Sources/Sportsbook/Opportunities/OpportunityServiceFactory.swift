import Vapor

public struct OpportunityServiceFactory {

    public var make: ((Request) -> OpportunityService)?

    public mutating func use(_ make: @escaping ((Request) -> OpportunityService)) {
        self.make = make
    }

}
