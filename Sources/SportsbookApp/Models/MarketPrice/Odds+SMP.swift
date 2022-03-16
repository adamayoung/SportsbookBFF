import Foundation
import SMP

extension Odds {

    init?(odds: SMP.Odds?) {
        guard let odds = odds else {
            return nil
        }

        let fractionalOdds = FractionalOdds(fractionOdds: odds.fractionalDisplayOdds)

        self.init(decimalOdds: odds.decimalDisplayOdds?.decimalOdds, fractionalOdds: fractionalOdds)
    }

}
