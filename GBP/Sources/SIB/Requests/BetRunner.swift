import Foundation

/// The BetRunner object containing all the necessary information describe an individual selection within this bet.
public struct BetRunner: Equatable, Hashable, Codable {

    /// A runner on which the bet will be placed.
    public let runner: BetRunnerRunner
    /// Finishing order of the runner in the bet for racing markets. E.g.: this is required for straight Forecast and straight Tricast bets.
    public let order: Int?
    /// If present, indicates the type of price override applied to the runner.
    public let priceOverlay: PriceOverlay?

    public init(runner: BetRunnerRunner, order: Int? = nil, priceOverlay: PriceOverlay? = nil) {
        self.runner = runner
        self.order = order
        self.priceOverlay = priceOverlay
    }

}
