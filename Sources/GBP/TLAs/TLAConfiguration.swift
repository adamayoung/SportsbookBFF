import Vapor

protocol TLAConfiguration {

    var tla: TLA { get }
    var gbpConfiguration: GBPConfiguration { get }
    var path: String { get }

}

extension TLAConfiguration {

    var uri: URI {
        "https://\(tla.rawValue).gbp-\(gbpConfiguration.environmentName).isp-pub.starsops.com\(path)"
    }

    func headers() throws -> HTTPHeaders {
        try gbpConfiguration.headers()
    }

}
