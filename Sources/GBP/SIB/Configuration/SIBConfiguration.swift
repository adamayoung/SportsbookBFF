import Vapor

struct SIBConfiguration: TLAConfiguration {

    let environment: TLAEnvironment
    let key: String?

    init(environment: TLAEnvironment, key: String?) {
        self.environment = environment
        self.key = key
    }

    var uri: URI {
        switch environment {
        case .ppbProd:
            return URI(string: "https://sib.paddypower.com/www/sports/fixedodds/transactional/v1/implyBets")

        case .ispQACore:
            return URI(string: "https://sib.gbp-qacore.isp-pub.starsops.com/www/sports/fixedodds/transactional/v1/implyBets")
        }
    }

}
