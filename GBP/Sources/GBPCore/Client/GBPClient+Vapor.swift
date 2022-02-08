import Vapor

public extension Request {

    var gbpClient: GBPClient {
        return GBPHTTPClient(client: self.client, decoder: .tla, logger: self.logger)
    }

}
