import Foundation

extension Odds {

    init?(odds: OddsDomainModel?) {
        guard let odds = odds else {
            return nil
        }

        let decimalOdds: Double? = {
            guard let decimalOdds = odds.decimalOdds as NSNumber? else {
                return nil
            }

            return Double(truncating: decimalOdds)
        }()
        let fractionalOdds = FractionalOdds(fractionalOdds: odds.fractionalOdds)

        self.init(decimalOdds: decimalOdds, fractionalOdds: fractionalOdds)
    }

}
