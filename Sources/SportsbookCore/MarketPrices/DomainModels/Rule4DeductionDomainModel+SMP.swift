import Foundation
import SMP

extension Rule4DeductionDomainModel {

    init(rule4Deduction: Rule4Deduction) {
        let priceType = Rule4DeductionDomainModel.PriceType(priceType: rule4Deduction.priceType)
        self.init(deduction: rule4Deduction.deduction, priceType: priceType, timeFrom: rule4Deduction.timeFrom,
                  timeTo: rule4Deduction.timeTo, selectionID: rule4Deduction.selectionId)
    }

}

extension Rule4DeductionDomainModel.PriceType {

    init(priceType: Rule4Deduction.PriceType) {
        switch priceType {
        case .livePrice: self = .livePrice
        case .startingPrice: self = .startingPrice
        case .unknown: self = .unknown
        }
    }

}
