import Foundation

extension OddsDTO {

    init?(odds: Odds?) {
        guard let odds = odds else {
            return nil
        }

        let decimalOdds: Double? = {
            guard let decimalOdds = odds.decimalOdds as NSNumber? else {
                return nil
            }

            return Double(truncating: decimalOdds)
        }()
        let fractionalOdds = FractionalOddsDTO(fractionalOdds: odds.fractionalOdds)

        self.init(decimalOdds: decimalOdds, fractionalOdds: fractionalOdds)
    }

}
