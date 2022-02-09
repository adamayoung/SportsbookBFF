import Foundation

/// Rule4 deduction metadata.
public struct Rule4DeductionDomainModel: Equatable, Hashable {

    /// Amount of the deduction.
    public let deduction: Decimal
    /// Price type to which deduction refers.
    public let priceType: PriceType
    /// Time from which deduction should be applied.
    public let timeFrom: Date?
    /// Time until which deduction should be applied.
    public let timeTo: Date?
    /// Selection identifier when the rule4 refers to a specific selection.
    public let selectionID: Int?

    public init(deduction: Decimal, priceType: Rule4DeductionDomainModel.PriceType, timeFrom: Date? = nil,
                timeTo: Date? = nil, selectionID: Int? = nil) {
        self.deduction = deduction
        self.priceType = priceType
        self.timeFrom = timeFrom
        self.timeTo = timeTo
        self.selectionID = selectionID
    }

}

public extension Rule4DeductionDomainModel {

    enum PriceType: CaseIterable {
        case livePrice
        case startingPrice
        case unknown
    }

}
