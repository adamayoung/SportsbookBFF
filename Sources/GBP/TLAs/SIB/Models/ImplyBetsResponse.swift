import Foundation

public struct ImplyBetsResponse: Codable {

    public let betCombinations: [BetCombination]
    public let winRunnerOdds: [RunnerOdds]?
//    public let betFailures: v.array(ImplyBetsRunnerFailureSchema),
//    public let legFailures: v.array(ImplyBetsLegFailureSchema),
    public let maxPayout: Double?
    public let allowsLowerOdds: Bool?
    public let hasBonusMoney: Bool?
    public let limits: [ImplyBetLimit]?
    public let respCode: ImplyBetsResponseCode

    public init(betCombinations: [BetCombination], winRunnerOdds: [RunnerOdds]? = nil, maxPayout: Double? = nil,
                allowsLowerOdds: Bool? = nil, hasBonusMoney: Bool? = nil, limits: [ImplyBetLimit]? = nil,
                respCode: ImplyBetsResponseCode) {
        self.betCombinations = betCombinations
        self.winRunnerOdds = winRunnerOdds
        self.maxPayout = maxPayout
        self.allowsLowerOdds = allowsLowerOdds
        self.hasBonusMoney = hasBonusMoney
        self.limits = limits
        self.respCode = respCode
    }

}
