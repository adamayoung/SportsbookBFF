import Vapor

extension Request {

    var cmsConfiguration: CMSConfiguration {
        CMSConfiguration(environment: self.cmsEnvironment)
    }

}
