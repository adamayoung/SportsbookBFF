import Foundation
import SMP

extension FractionalOddsDomainModel {

    init?(fractionOdds: SMP.FractionalOdds?) {
        guard let fractionOdds = fractionOdds else {
            return nil
        }

        self.init(numerator: fractionOdds.numerator, denominator: fractionOdds.denominator)
    }

}
