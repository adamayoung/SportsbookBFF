import Vapor

struct FBRConfiguration: TLAConfiguration {

    let environment: TLAEnvironment
    let key: String?

    init(environment: TLAEnvironment, key: String?) {
        self.environment = environment
        self.key = key
    }

    var uri: URI {
        switch environment {
        case .ispQACore:
            return URI(string: "https://fbr.gbp-qacore.isp-pub.starsops.com/api/FixedOddsBetReporting/v1.0/searchBets")

        case .ppbProd:
            return URI(string: "https://fbr.gbp-qacore.isp-pub.starsops.com/api/FixedOddsBetReporting/v1.0/searchBets")
        }
    }

}
