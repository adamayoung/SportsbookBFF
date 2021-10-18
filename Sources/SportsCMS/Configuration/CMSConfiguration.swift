import Vapor

struct CMSConfiguration {

    private let environment: CMSEnvironment

    init(environment: CMSEnvironment) {
        self.environment = environment
    }

    var baseURI: URI {
        switch environment {
        case .ppbProd:
            return URI(string: "https://cms-api.cms-ppb-dev.isp-pub.starsops.com")

        case .ispQACore:
            return URI(string: "https://cms-api.cms-dev.isp-pub.starsops.com")

        case .ispQR:
            return URI(string: "https://cms-api.cms-qr.isp-pub.starsops.com")

        case .ispProd:
            return URI(string: "https://cms-api.cms-prod.isp-pub.starsops.com")
        }
    }

}
