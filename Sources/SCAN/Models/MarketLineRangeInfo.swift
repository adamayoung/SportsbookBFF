import Foundation

public struct MarketLineRangeInfo: Equatable, Codable {

    public let maxUnitValue: Int
    public let minUnitValue: Int
    public let interval: Int
    public let marketUnit: String

    public init(maxUnitValue: Int, minUnitValue: Int, interval: Int, marketUnit: String) {
        self.maxUnitValue = maxUnitValue
        self.minUnitValue = minUnitValue
        self.interval = interval
        self.marketUnit = marketUnit
    }

}
