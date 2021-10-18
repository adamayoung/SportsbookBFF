import Vapor

struct SCANConfiguration: TLAConfiguration {

    let environment: TLAEnvironment
    let key: String?

    init(environment: TLAEnvironment, key: String?) {
        self.environment = environment
        self.key = key
    }

    var uri: URI {
        switch environment {
        case .ppbProd:
            return URI(string: "https://mga.paddypower.com/www/sports/navigation/facet/v1.0/search")

        case .ispQACore:
            return URI(string: "https://scan.gbp-qacore.isp-pub.starsops.com/www/sports/navigation/facet/v1.0/search")
        }
    }

}
