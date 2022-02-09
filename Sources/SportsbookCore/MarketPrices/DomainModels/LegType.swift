import Foundation

public enum LegType: CaseIterable {

    /// Simple selection. Contain only one selection per leg.
    case simpleSelection
    /// Straight Forecast. Contain 2 selections per leg finishing in 1st and 2nd places. Straight Forecast bets must be properly filled with the finishing order of the runners.
    case forecast
    /// Reverse Forecast. Contains 2 selections per leg finishing in 1st and 2nd in the race in either order.
    case reverseForecast
    /// Combination forecast. Contains at least 3 selections per leg with any of them finishing in 1st and 2nd in any order. This is equivalent of having 6 permuted Forecasts.
    case combinationForecase
    /// Straight Tricast. Contains 3 selections per leg finishing in 1st, 2nd and 3rd places. Straight Tricast bets must be properly filled with the finishing order of the runners.
    case tricast
    /// Combination Tricast. Contains at least 3 selections per leg finishing in 1st, 2nd and 3rd places in any order. This is equivalent of having 6 permuted Straight Tricasts.
    case combinationTricast
    /// Scorecast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Correct Score selection.
    case scorecast
    /// Wincast. Contains 2 selections per leg consisting of a First Goalscorer selection and a Match Result selection.
    case wincast
    /// Unknown.
    case unknown

}
