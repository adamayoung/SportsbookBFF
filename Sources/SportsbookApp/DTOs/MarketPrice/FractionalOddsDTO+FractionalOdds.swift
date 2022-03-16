import Foundation

extension FractionalOddsDTO {

    init?(fractionalOdds: FractionalOdds?) {
        guard let fractionalOdds = fractionalOdds else {
            return nil
        }

        self.init(numerator: fractionalOdds.numerator, denominator: fractionalOdds.denominator)
    }

}
