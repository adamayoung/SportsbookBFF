import Foundation
import SMP

extension FractionalOdds {

    init?(fractionOdds: SMP.FractionalOdds?) {
        guard let fractionOdds = fractionOdds else {
            return nil
        }

        self.init(numerator: fractionOdds.numerator, denominator: fractionOdds.denominator)
    }

}
