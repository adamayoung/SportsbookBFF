import Vapor

public extension Application {

    private struct OpportunityServiceKey: StorageKey {
        typealias Value = OpportunityServiceFactory
    }

    var opportunityService: OpportunityServiceFactory {
        get {
            self.storage[OpportunityServiceKey.self] ?? .init()
        }
        set {
            self.storage[OpportunityServiceKey.self] = newValue
        }
    }

}

public extension Request {

    var opportunityService: OpportunityService {
        self.application.opportunityService.make!(self)
    }

}
