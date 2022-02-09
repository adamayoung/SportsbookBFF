import Foundation
import SMP

extension LegType {

    init(legType: SMP.LegType) {
        switch legType {
        case .simpleSelection:
            self = .simpleSelection

        case .forecast:
            self = .forecast

        case .reverseForecast:
            self = .reverseForecast

        case .combinationForecase:
            self = .combinationTricast

        case .tricast:
            self = .tricast

        case .combinationTricast:
            self = .combinationTricast

        case .scorecast:
            self = .scorecast

        case .wincast:
            self = .wincast

        case .unknown:
            self = .unknown
        }
    }

}
