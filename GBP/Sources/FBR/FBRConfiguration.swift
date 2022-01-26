import Foundation
import GBPCore

struct FBRConfiguration: TLAConfiguration {

    let tla: TLA = .fbr
    let gbpConfiguration: GBPConfiguration
    let path = "/api/FixedOddsBetReporting/v1.0/searchBets"

    init(gbpConfiguration: GBPConfiguration) {
        self.gbpConfiguration = gbpConfiguration
    }

}
