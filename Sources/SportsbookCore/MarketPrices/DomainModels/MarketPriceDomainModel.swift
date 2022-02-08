import Foundation

public struct MarketPriceDomainModel: Identifiable, Equatable, Hashable {

    public var id: String { marketID }

    public let marketID: String

    public init(marketID: String) {
        self.marketID = marketID
    }

}
