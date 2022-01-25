import Foundation

public struct ImplyBetLimit: Codable {

    public let limitType: ImplyBetLimit.LimitType
    public let minStake: Double?
    public let maxPayout: Double?
    public let maxNumberOfLines: Int?

    public init(limitType: ImplyBetLimit.LimitType, minStake: Double? = nil, maxPayout: Double? = nil,
                maxNumberOfLines: Int? = nil) {
        self.limitType = limitType
        self.minStake = minStake
        self.maxPayout = maxPayout
        self.maxNumberOfLines = maxNumberOfLines
    }

}

extension ImplyBetLimit {

    public enum LimitType: String, CaseIterable, Codable {
        case systemBet = "SYSTEM_BET"
    }

}
