import Foundation

public struct MarketPrice: Identifiable, Equatable, Codable {

    public var id: String { marketID }

    public let marketID: String

    public init(marketID: String) {
        self.marketID = marketID
    }

}
