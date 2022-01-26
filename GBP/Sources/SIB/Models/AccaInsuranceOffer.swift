import Foundation

public struct AccaInsuranceOffer: Codable {

    public let avgOdds: Odds
    public let discount: Double?

    public init(avgOdds: Odds, discount: Double? = nil) {
        self.avgOdds = avgOdds
        self.discount = discount
    }

}
