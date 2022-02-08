import Foundation

/// Rule4 deduction metadata.
public struct Rule4Deduction: Equatable, Hashable, Codable {

    /// Amount of the deduction.
    public let deduction: Decimal
    /// Price type to which deduction refers.
    public let priceType: PriceType
    /// Time from which deduction should be applied.
    public let timeFrom: Date?
    /// Time until which deduction should be applied.
    public let timeTo: Date?
    /// Selection identifier when the rule4 refers to a specific selection.
    public let selectionId: Int?

    public init(deduction: Decimal, priceType: PriceType, timeFrom: Date? = nil, timeTo: Date? = nil,
                selectionId: Int? = nil) {
        self.deduction = deduction
        self.priceType = priceType
        self.timeFrom = timeFrom
        self.timeTo = timeTo
        self.selectionId = selectionId
    }

}
