import Foundation
import GBPCore

struct SMPConfiguration: TLAConfiguration {

    let tla: TLA = .smp
    let gbpConfiguration: GBPConfiguration
    let path = "/www/sports/fixedodds/readonly/v1/getMarketPrices?priceHistory=1"

    init(gbpConfiguration: GBPConfiguration) {
        self.gbpConfiguration = gbpConfiguration
    }

}
