import Foundation

public struct ImpyBetsResponse: Codable {

    public let betCombinations: [BetCombination]
    public let winRunnerOdds: [RunnerOdds]?
//    public let betFailures: v.array(ImplyBetsRunnerFailureSchema),
//    public let legFailures: v.array(ImplyBetsLegFailureSchema),
    public let maxPayout: Double?
    public let allowsLowerOdds: Bool?
    public let hasBonusMoney: Bool?
    public let limits: [BetLimit]?
    public let respCode: ResponseCode

    public init(betCombinations: [BetCombination], winRunnerOdds: [RunnerOdds]? = nil, maxPayout: Double? = nil,
                allowsLowerOdds: Bool? = nil, hasBonusMoney: Bool? = nil, limits: [BetLimit]? = nil,
                respCode: ResponseCode) {
        self.betCombinations = betCombinations
        self.winRunnerOdds = winRunnerOdds
        self.maxPayout = maxPayout
        self.allowsLowerOdds = allowsLowerOdds
        self.hasBonusMoney = hasBonusMoney
        self.limits = limits
        self.respCode = respCode
    }

}
