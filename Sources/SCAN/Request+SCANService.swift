import Vapor

extension Request {

    public var scan: SCANService {
        application.scanServices.make(self)
    }

}
