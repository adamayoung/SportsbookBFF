import Foundation
import SMP
import Sportsbook

extension Sportsbook.Odds {

    init?(odds: SMP.Odds?) {
        guard let odds = odds else {
            return nil
        }

        let fractionalOdds = Sportsbook.FractionalOdds(fractionOdds: odds.fractionalDisplayOdds)

        self.init(decimalOdds: odds.decimalDisplayOdds?.decimalOdds, fractionalOdds: fractionalOdds,
                  americanOdds: odds.americanDisplayOdds?.americanOddsInt)
    }

}
