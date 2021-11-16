import Vapor

extension Request {

    var cmsConfiguration: CMSConfiguration {
        CMSConfiguration(environment: self.environment)
    }

}

private extension Request {

    var environment: CMSEnvironment {
        .dev
    }

}
