import Foundation
import SMP

extension OddsDomainModel {

    init?(odds: SMP.Odds?) {
        guard let odds = odds else {
            return nil
        }

        let fractionalOdds = FractionalOddsDomainModel(fractionOdds: odds.fractionalDisplayOdds)

        self.init(decimalOdds: odds.decimalDisplayOdds?.decimalOdds, fractionalOdds: fractionalOdds)
    }

}
