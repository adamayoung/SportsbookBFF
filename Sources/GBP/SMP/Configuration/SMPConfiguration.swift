import Vapor

struct SMPConfiguration: TLAConfiguration {

    let environment: TLAEnvironment
    let key: String?

    init(environment: TLAEnvironment, key: String?) {
        self.environment = environment
        self.key = key
    }

    var uri: URI {
        switch environment {
        case .ppbProd:
            return URI(string: "https://smp.paddypower.com/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1")

        case .ispQACore:
            return URI(string: "https://smp.gbp-qacore.isp-pub.starsops.com/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1")
        }
    }

}
