import Foundation
import SMP

extension MarketBettingType {

    init(bettingType: SMP.MarketBettingType) {
        switch bettingType {
        case .fixedOdds:
            self = .fixedOdds

        case .movingHandicap:
            self = .movingHandicap

        case .unknown:
            self = .unknown
        }
    }

}
