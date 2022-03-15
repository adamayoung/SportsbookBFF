import Foundation

extension FractionalOdds {

    init?(fractionalOdds: FractionalOddsDomainModel?) {
        guard let fractionalOdds = fractionalOdds else {
            return nil
        }

        self.init(numerator: fractionalOdds.numerator, denominator: fractionalOdds.denominator)
    }

}
