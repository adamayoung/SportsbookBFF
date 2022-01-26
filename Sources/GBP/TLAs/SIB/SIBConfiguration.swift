import Vapor

struct SIBConfiguration: TLAConfiguration {

    let tla: TLA = .sib
    let gbpConfiguration: GBPConfiguration
    let path = "/api/sports/fixedodds/transactional/v1/implyBets"

    init(gbpConfiguration: GBPConfiguration) {
        self.gbpConfiguration = gbpConfiguration
    }

}
