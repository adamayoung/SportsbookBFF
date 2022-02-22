import Vapor

/// SMP Service Factory for Vapor.
public struct SMPServiceFactory {

    /// Closure to make a new `SMPService`.
    public private(set) var make: ((Request) -> SMPService)?

    /// Sets the closure to make a new `SMPService`.
    public mutating func use(_ make: @escaping ((Request) -> SMPService)) {
        self.make = make
    }

}
