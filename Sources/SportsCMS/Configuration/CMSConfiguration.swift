import Vapor

struct CMSConfiguration {

    private let environment: CMSEnvironment

    init(environment: CMSEnvironment) {
        self.environment = environment
    }

    var baseURI: URI {
        URI(string: "https://cms-api.cms-\(environment.rawValue).isp-pub.starsops.com")
    }

}
