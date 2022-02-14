import Foundation

/// Rule4 deduction metadata.
public struct Rule4Deduction: Equatable, Hashable, Codable {

    /// Amount of the deduction.
    public let deduction: Decimal
    /// Price type to which deduction refers.
    public let priceType: Rule4Deduction.PriceType
    /// Time from which deduction should be applied.
    public let timeFrom: Date?
    /// Time until which deduction should be applied.
    public let timeTo: Date?
    /// Selection identifier when the rule4 refers to a specific selection.
    public let selectionId: Int?

    public init(deduction: Decimal, priceType: Rule4Deduction.PriceType, timeFrom: Date? = nil, timeTo: Date? = nil,
                selectionId: Int? = nil) {
        self.deduction = deduction
        self.priceType = priceType
        self.timeFrom = timeFrom
        self.timeTo = timeTo
        self.selectionId = selectionId
    }

}

extension Rule4Deduction {

    public enum PriceType: String, CaseIterable, Codable {
        /// Live price (LP).
        case livePrice = "LIVE_PRICE"
        /// Starting price (SP).
        case startingPrice = "STARTING_PRICE"
        /// Unknown.
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

}
