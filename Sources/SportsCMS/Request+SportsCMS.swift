import Vapor

extension Request {

    public var sportsCMS: SportsCMSProvider {
        application.sportsCMSProviders.make(self)
    }

}
