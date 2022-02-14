import Foundation
import SportsbookCore

extension Rule4Deduction {

    init(rule4Deduction: Rule4DeductionDomainModel) {
        let deduction = Double(truncating: rule4Deduction.deduction as NSNumber)
        let priceType = Rule4Deduction.PriceType(priceType: rule4Deduction.priceType)

        self.init(deduction: deduction, priceType: priceType, timeFrom: rule4Deduction.timeFrom,
                  timeTo: rule4Deduction.timeTo, selectionID: rule4Deduction.selectionID)
    }

}

extension Rule4Deduction.PriceType {

    init(priceType: Rule4DeductionDomainModel.PriceType) {
        switch priceType {
        case .livePrice: self = .livePrice
        case .startingPrice: self = .startingPrice
        case .unknown: self = .unknown
        }
    }

}
