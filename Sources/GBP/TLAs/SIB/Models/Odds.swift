import Foundation

public struct Odds: Codable {

    public let trueOdds: TrueOdds
    public let decimalDisplayOdds: DecimalOdds?
    public let fractionalDisplayOdds: FractionalOdds?

    public init(trueOdds: Odds.TrueOdds, decimalDisplayOdds: Odds.DecimalOdds? = nil,
                fractionalDisplayOdds: Odds.FractionalOdds? = nil) {
        self.trueOdds = trueOdds
        self.decimalDisplayOdds = decimalDisplayOdds
        self.fractionalDisplayOdds = fractionalDisplayOdds
    }

}

extension Odds {

    public struct TrueOdds: Codable {

        public let decimalOdds: DecimalOdds
        public let fractionalOdds: FractionalOdds?

        public init(decimalOdds: Odds.DecimalOdds, fractionalOdds: Odds.FractionalOdds? = nil) {
            self.decimalOdds = decimalOdds
            self.fractionalOdds = fractionalOdds
        }

    }

    public struct DecimalOdds: Codable {

        public let decimalOdds: Double

        public init(decimalOdds: Double) {
            self.decimalOdds = decimalOdds
        }

    }

    public struct FractionalOdds: Codable {

        public let numerator: Int
        public let denominator: Int

        public init(numerator: Int, denominator: Int) {
            self.numerator = numerator
            self.denominator = denominator
        }

    }

}
