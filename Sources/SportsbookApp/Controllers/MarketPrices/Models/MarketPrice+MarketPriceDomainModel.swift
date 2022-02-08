import Foundation
import SportsbookCore

extension MarketPrice {

    init(marketPrice: MarketPriceDomainModel) {
        self.init(marketID: marketPrice.marketID)
    }

}
