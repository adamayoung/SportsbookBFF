import Vapor

/// Rule4 deduction metadata.
struct Rule4DeductionDTO: Equatable, Content {

    /// Amount of the deduction.
    let deduction: Double
    /// Price type to which deduction refers.
    let priceType: PriceType
    /// Time from which deduction should be applied.
    let timeFrom: Date?
    /// Time until which deduction should be applied.
    let timeTo: Date?
    /// Selection identifier when the rule4 refers to a specific selection.
    let selectionID: Int?

    init(deduction: Double, priceType: Rule4DeductionDTO.PriceType, timeFrom: Date? = nil, timeTo: Date? = nil,
         selectionID: Int? = nil) {
        self.deduction = deduction
        self.priceType = priceType
        self.timeFrom = timeFrom
        self.timeTo = timeTo
        self.selectionID = selectionID
    }

}

extension Rule4DeductionDTO {

    enum PriceType: String, CaseIterable, Codable {
        case livePrice
        case startingPrice
        case unknown
    }

}
