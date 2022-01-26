import Foundation

/// A leg bet, which can have multiple runners.
public struct BetLeg: Equatable, Hashable, Codable {

    /// Leg type of this bet combination. E.g.: Simple selection, Tricast, Forecast, etc.
    public let legType: LegType
    /// List of bet runners.
    public let betRunners: [BetRunner]

    public init(legType: LegType = .default, betRunners: [BetRunner]) {
        self.legType = legType
        self.betRunners = betRunners
    }

}
