import Vapor

extension Request {

    public var cmsClient: CMSClientProvider {
        CMSClient(client: client, decoder: .cms)
    }

}
