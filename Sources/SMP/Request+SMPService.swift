import Vapor

extension Request {

    public var smp: SMPService {
        application.smpServices.make(self)
    }

}
