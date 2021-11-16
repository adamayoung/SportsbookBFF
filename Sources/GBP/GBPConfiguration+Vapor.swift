import Vapor

extension Request {

    var gbpConfiguration: GBPConfiguration {
        GBPConfiguration(environment: self.environment, tlaKey: self.tlaKey)
    }

}

private extension Request {

    var environment: GBPEnvironment {
        .qaCore
    }

    var tlaKey: String? {
        Environment.get("TLA_KEY")
    }

}
