import Foundation

public struct MarketAttachment: Codable {

    public let marketId: String
    public let key: String
    public let eventTypeId: Int
    public let eventId: Int
    public let upperLevelEventId: Int
    public let topLevelEventId: Int
    public let numberOfUpperLevels: Int
    public let competitionId: Int
    public let marketName: String
    public let marketTime: Date
    public let canTurnInPlay: Bool
    public let marketType: String
    public let bspMarket: Bool
    public let inPlay: Bool
    public let runners: [Runner]
    public let sgmMarket: Bool
    public let betDelay: Int
    public let numberOfWinners: Int
//                    "associatedMarkets": [
//                        {
//                            "eventId": 30188799,
//                            "eventTypeId": 5,
//                            "externalMarketId": "42.241749491"
//                        }
//                    ],
    public let marketLevels: [String]
    public let sortPriority: Int
    public let bettingType: MarketBettingType
    public let marketStatus: MarketAttachment.MarketStatus

    public init(marketId: String, key: String, eventTypeId: Int, eventId: Int, upperLevelEventId: Int,
                topLevelEventId: Int, numberOfUpperLevels: Int, competitionId: Int, marketName: String,
                marketTime: Date, canTurnInPlay: Bool, marketType: String, bspMarket: Bool, inPlay: Bool,
                runners: [Runner], sgmMarket: Bool, betDelay: Int, numberOfWinners: Int, marketLevels: [String],
                sortPriority: Int, bettingType: MarketBettingType, marketStatus: MarketStatus) {
        self.marketId = marketId
        self.key = key
        self.eventTypeId = eventTypeId
        self.eventId = eventId
        self.upperLevelEventId = upperLevelEventId
        self.topLevelEventId = topLevelEventId
        self.numberOfUpperLevels = numberOfUpperLevels
        self.competitionId = competitionId
        self.marketName = marketName
        self.marketTime = marketTime
        self.canTurnInPlay = canTurnInPlay
        self.marketType = marketType
        self.bspMarket = bspMarket
        self.inPlay = inPlay
        self.runners = runners
        self.sgmMarket = sgmMarket
        self.betDelay = betDelay
        self.numberOfWinners = numberOfWinners
        self.marketLevels = marketLevels
        self.sortPriority = sortPriority
        self.bettingType = bettingType
        self.marketStatus = marketStatus
    }

}

extension MarketAttachment {

    public enum MarketStatus: String, CaseIterable, Codable {
        case `open` = "OPEN"
        case inactive = "INACTIVE"
        case suspended = "SUSPENDED"
        case closed = "CLOSED"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try MarketStatus(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

}
