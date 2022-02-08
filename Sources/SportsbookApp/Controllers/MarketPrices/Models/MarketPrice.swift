import Foundation

struct MarketPrice: Identifiable, Equatable, Codable {

    var id: String { marketID }

    let marketID: String

    init(marketID: String) {
        self.marketID = marketID
    }

}
