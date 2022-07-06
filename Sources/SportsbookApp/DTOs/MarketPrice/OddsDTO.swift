import Vapor

/// An object describing a odds on a selection.
struct OddsDTO: Equatable, Content {

    /// The decimal representation of these odds with half round up 2 decimal places. This must not be used for calculations.
    let decimalOdds: Double?
    /// The fractional representation of these odds. This should be used for all needed calculations.
    let fractionalOdds: FractionalOddsDTO?
    /// The american representation of these odds. Considered to be for display purposes only, it may not be a precise depiction of the odds currently in force.
    let americanOdds: Int?

    init(decimalOdds: Double?, fractionalOdds: FractionalOddsDTO?, americanOdds: Int?) {
        self.decimalOdds = decimalOdds
        self.fractionalOdds = fractionalOdds
        self.americanOdds = americanOdds
    }

}
