import Foundation
import SMP

extension MarketPriceDomainModel {

    init(marketPrice: MarketPrice) {
        self.init(marketID: marketPrice.marketId)
    }

}
