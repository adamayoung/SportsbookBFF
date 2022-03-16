import Vapor

/// An object describing a odds on a selection.
struct OddsDTO: Equatable, Content {

    /// The decimal representation of these odds with half round up 2 decimal places. This must not be used for calculations.
    let decimalOdds: Double?
    /// The fractional representation of these odds. This should be used for all needed calculations.
    let fractionalOdds: FractionalOddsDTO?

    init(decimalOdds: Double?, fractionalOdds: FractionalOddsDTO?) {
        self.decimalOdds = decimalOdds
        self.fractionalOdds = fractionalOdds
    }

}
