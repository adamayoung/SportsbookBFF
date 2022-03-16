import Foundation
import SMP

extension Rule4Deduction {

    init?(rule4Deduction: SMP.Rule4Deduction) {
        guard let priceType = Rule4Deduction.PriceType(priceType: rule4Deduction.priceType) else {
            return nil
        }

        self.init(deduction: rule4Deduction.deduction, priceType: priceType, timeFrom: rule4Deduction.timeFrom,
                  timeTo: rule4Deduction.timeTo, selectionID: rule4Deduction.selectionId)
    }

}

extension Rule4Deduction.PriceType {

    init?(priceType: SMP.Rule4Deduction.PriceType) {
        switch priceType {
        case .livePrice: self = .livePrice
        case .startingPrice: self = .startingPrice
        default:
            return nil
        }
    }

}
