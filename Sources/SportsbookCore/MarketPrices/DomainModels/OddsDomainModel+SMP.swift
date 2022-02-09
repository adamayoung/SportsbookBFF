import Foundation
import SMP

extension OddsDomainModel {

    init?(odds: Odds?) {
        guard let odds = odds else {
            return nil
        }

        let fractionalOdds = FractionalOddsDomainModel(fractionOdds: odds.fractionalDisplayOdds)

        self.init(decimalOdds: odds.decimalDisplayOdds?.decimalOdds, fractionalOdds: fractionalOdds)
    }

}
