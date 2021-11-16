import Vapor

struct SCANConfiguration: TLAConfiguration {

    let tla: TLA = .scan
    let gbpConfiguration: GBPConfiguration
    let path = "/www/sports/navigation/facet/v1.0/search"

    init(gbpConfiguration: GBPConfiguration) {
        self.gbpConfiguration = gbpConfiguration
    }

}
