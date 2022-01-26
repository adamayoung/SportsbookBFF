import Foundation

public struct Runner: Identifiable, Codable {

    public var id: String {
        "\(marketId)-\(selectionId)"
    }
    public let marketId: String
    public let selectionId: Int
    public let handicap: Double?

    public init(marketId: String, selectionId: Int, handicap: Double? = nil) {
        self.marketId = marketId
        self.selectionId = selectionId
        self.handicap = handicap
    }

}
