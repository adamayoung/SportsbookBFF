import Foundation

public struct BonusWalletCondition: Codable {

    public let type: WalletConditionType
    public let min: Double?
    public let max: Double?
    public let value: Double?

    public init(type: WalletConditionType, min: Double? = nil, max: Double? = nil, value: Double? = nil) {
        self.type = type
        self.min = min
        self.max = max
        self.value = value
    }

}
