import Foundation

extension Rule4DeductionDTO {

    init(rule4Deduction: Rule4Deduction) {
        let deduction = Double(truncating: rule4Deduction.deduction as NSNumber)
        let priceType = Rule4DeductionDTO.PriceType(priceType: rule4Deduction.priceType)

        self.init(deduction: deduction, priceType: priceType, timeFrom: rule4Deduction.timeFrom,
                  timeTo: rule4Deduction.timeTo, selectionID: rule4Deduction.selectionID)
    }

}

extension Rule4DeductionDTO.PriceType {

    init(priceType: Rule4Deduction.PriceType) {
        switch priceType {
        case .livePrice: self = .livePrice
        case .startingPrice: self = .startingPrice
        }
    }

}
