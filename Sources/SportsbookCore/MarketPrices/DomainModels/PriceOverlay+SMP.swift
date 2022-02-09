import Foundation
import SMP

extension PriceOverlay {

    init?(priceOverlay: SMP.PriceOverlay?) {
        guard let priceOverlay = priceOverlay else {
            return nil
        }

        switch priceOverlay {
        case .enhancedPricePromotion:
            self = .enhancedPricePromotion

        case .unknown:
            self = .unknown
        }
    }

}
