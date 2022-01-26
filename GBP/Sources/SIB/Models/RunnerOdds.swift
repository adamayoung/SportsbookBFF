import Foundation

public struct RunnerOdds: Codable {

    public let runner: Runner
    public let odds: Odds?
    public let priceOverlay: PriceOverlay?
    public let eachwayPlaces: Int?
    public let placeFraction: Odds.FractionalOdds?
    public let eachwayEdgeRange: RunnerOdds.Range?
    public let canBeBanker: Bool?
    public let isBanker: Bool?
    public let noCombiId: Int?
    public let inplay: Bool?
    public let availablePriceTypes: [RunnerOdds.PriceType]?

    public init(runner: Runner, odds: Odds? = nil, priceOverlay: PriceOverlay? = nil, eachwayPlaces: Int? = nil,
                placeFraction: Odds.FractionalOdds? = nil, eachwayEdgeRange: RunnerOdds.Range? = nil,
                canBeBanker: Bool? = nil, isBanker: Bool? = nil, noCombiId: Int? = nil, inplay: Bool? = nil,
                availablePriceTypes: [RunnerOdds.PriceType]? = nil) {
        self.runner = runner
        self.odds = odds
        self.priceOverlay = priceOverlay
        self.eachwayPlaces = eachwayPlaces
        self.placeFraction = placeFraction
        self.eachwayEdgeRange = eachwayEdgeRange
        self.canBeBanker = canBeBanker
        self.isBanker = isBanker
        self.noCombiId = noCombiId
        self.inplay = inplay
        self.availablePriceTypes = availablePriceTypes
    }

}

extension RunnerOdds {

    public enum PriceType: String, CaseIterable, Codable {
        case livePrice = "LIVE_PRICE"
        case startingPrice = "STARTING_PRICE"
        case guaranteedPrice = "GUARANTEED_PRICE"
    }

    public struct Range: Codable {

        public let min: Int
        public let max: Int

        public init(min: Int, max: Int) {
            self.min = min
            self.max = max
        }

    }

}
