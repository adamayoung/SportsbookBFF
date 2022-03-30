import Vapor

extension Request {

    public var gbpClient: GBPClient {
        ISPGBPClient(client: client, decoder: .tla, logger: logger)
    }

}
