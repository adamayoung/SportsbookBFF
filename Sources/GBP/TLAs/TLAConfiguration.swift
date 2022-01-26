import Vapor

protocol TLAConfiguration {

    var tla: TLA { get }
    var gbpConfiguration: GBPConfiguration { get }
    var path: String { get }

}

extension TLAConfiguration {

    var uri: URI {
        switch gbpConfiguration.environment {
        case .qaCore:
            return "https://\(tla.rawValue).gbp-\(gbpConfiguration.environmentName).isp-pub.starsops.com\(path)"

        case .prod:
            return "https://\(tla.rawValue).\(gbpConfiguration.environmentName).gbp.isp.starsops.com\(path)"
        }

    }

    func headers() throws -> HTTPHeaders {
        try gbpConfiguration.headers()
    }

}
