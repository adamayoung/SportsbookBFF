import Foundation

public enum PriceOverlay: String, CaseIterable, Codable {

    /// Enhanced Price Promotion.
    case enhancedPricePromotion = "ENHANCED_PRICE_PROMOTION"
    /// Unknown.
    case unknown = "UNKNOWN"

    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }

}
