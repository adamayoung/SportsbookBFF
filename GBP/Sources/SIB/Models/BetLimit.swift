import Foundation

public struct BetLimit: Codable {

    public let limitType: BetLimit.LimitType
    public let minStake: Double?
    public let maxPayout: Double?
    public let maxNumberOfLines: Int?

    public init(limitType: BetLimit.LimitType, minStake: Double? = nil, maxPayout: Double? = nil,
                maxNumberOfLines: Int? = nil) {
        self.limitType = limitType
        self.minStake = minStake
        self.maxPayout = maxPayout
        self.maxNumberOfLines = maxNumberOfLines
    }

}

extension BetLimit {

    public enum LimitType: String, CaseIterable, Codable {
        case systemBet = "SYSTEM_BET"
    }

}
