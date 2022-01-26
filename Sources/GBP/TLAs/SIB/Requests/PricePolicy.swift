import Foundation

public enum PricePolicy: String, CaseIterable, Codable {

    /// The normal price policy will guide FOB to use OpenBet reqBetBuild operation in order to build the available bet combinations.
    case normal = "NORMAL"
    /// The suggested price policy will guide FOB to use FOB internal imply bets engine in order to build the available bet combinations.
    case suggested = "SUGGESTED"

    public static var `default`: PricePolicy {
        .normal
    }

}
