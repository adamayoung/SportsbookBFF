import Vapor

extension Request {

    public var sportsCMS: SportsCMSService {
        application.sportsCMSServices.make(self)
    }

}
