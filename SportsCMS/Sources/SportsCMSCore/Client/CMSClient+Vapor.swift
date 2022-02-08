import Vapor

public extension Request {

    var cmsClient: CMSClient {
        CMSHTTPClient(client: self.client, decoder: .cms, logger: self.logger)
    }

}
