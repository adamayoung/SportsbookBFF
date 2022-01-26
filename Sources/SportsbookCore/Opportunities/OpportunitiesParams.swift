import Foundation

public struct OpportunitiesParams {

    public let betLegs: [OpportunitiesParams.BetLeg]
    public let currency: String
    public let locale: Locale

    public init(betLegs: [OpportunitiesParams.BetLeg], currency: String, locale: Locale) {
        self.betLegs = betLegs
        self.currency = currency
        self.locale = locale
    }

}

extension OpportunitiesParams {

    public struct BetLeg {
        public let runners: [OpportunitiesParams.BetLeg.Runner]

        public init(runners: [OpportunitiesParams.BetLeg.Runner]) {
            self.runners = runners
        }
    }

}

extension OpportunitiesParams.BetLeg {

    public struct Runner: Identifiable {

        public var id: String {
            "\(marketID)-\(selectionID)"
        }
        public let marketID: String
        public let selectionID: Int
        public let handicap: Double?

        public init(marketID: String, selectionID: Int, handicap: Double? = nil) {
            self.marketID = marketID
            self.selectionID = selectionID
            self.handicap = handicap
        }

    }

}
