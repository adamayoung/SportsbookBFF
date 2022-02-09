import Foundation
import SMP

extension MarketStatus {

    init(marketStatus: SMP.MarketStatus) {
        switch marketStatus {
        case .open:
            self = .open

        case .suspended:
            self = .suspended

        case .unknown:
            self = .unknown
        }
    }

}
