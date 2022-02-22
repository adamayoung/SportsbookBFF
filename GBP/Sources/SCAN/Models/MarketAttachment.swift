import Foundation

public struct MarketAttachment: Equatable, Codable {

    public let marketID: MarketID
    public let key: String?
    public let eventTypeID: EventTypeID
    public let eventID: EventID
    public let upperLevelEventID: EventID?
    public let topLevelEventID: EventID?
    public let numberOfUpperLevels: Int?
    public let raceID: RaceID?
    public let meetingID: MeetingID?
    public let marketName: String?
    public let marketTime: Date?
    public let marketSuspendTime: Date?
    public let canTurnInPlay: Bool
    public let bettingType: MarketBettingType
    public let marketType: String
    public let bspMarket: Bool
    public let inPlay: Bool
    public let sgmMarket: Bool
    public let marketStatus: MarketStatus
    public let runners: [RunnerAttachment]?
    public let betDelay: Int
    public let numberOfRunners: Int
    public let numberOfActiveRunners: Int
    public let numberOfWinners: Int
    public let associatedMarkets: [AttachmentKey]?
    public let productType: ProductType
    public let marketTypeName: String?
    public let marketLevels: [MarketLevel]?
    public let sortPriority: Int
    public let marketLineRangeInfo: MarketLineRangeInfo?
    public let raceClass: String?
    public let raceType: String?
    public let raceNumber: String?
    public let competitionID: CompetitionID

    public init(marketID: MarketID, key: String? = nil, eventTypeID: EventTypeID, eventID: EventID,
                upperLevelEventID: EventID? = nil, topLevelEventID: EventID? = nil, numberOfUpperLevels: Int? = nil,
                raceID: RaceID? = nil, meetingID: MeetingID? = nil, marketName: String? = nil, marketTime: Date? = nil,
                marketSuspendTime: Date? = nil, canTurnInPlay: Bool, bettingType: MarketBettingType, marketType: String,
                bspMarket: Bool, inPlay: Bool, sgmMarket: Bool, marketStatus: MarketStatus,
                runners: [RunnerAttachment]? = nil, betDelay: Int, numberOfRunners: Int, numberOfActiveRunners: Int,
                numberOfWinners: Int, associatedMarkets: [AttachmentKey]? = nil, productType: ProductType,
                marketTypeName: String? = nil, marketLevels: [MarketLevel]? = nil, sortPriority: Int,
                marketLineRangeInfo: MarketLineRangeInfo? = nil, raceClass: String? = nil, raceType: String? = nil,
                raceNumber: String? = nil, competitionID: CompetitionID) {
        self.marketID = marketID
        self.key = key
        self.eventTypeID = eventTypeID
        self.eventID = eventID
        self.upperLevelEventID = upperLevelEventID
        self.topLevelEventID = topLevelEventID
        self.numberOfUpperLevels = numberOfUpperLevels
        self.raceID = raceID
        self.meetingID = meetingID
        self.marketName = marketName
        self.marketTime = marketTime
        self.marketSuspendTime = marketSuspendTime
        self.canTurnInPlay = canTurnInPlay
        self.bettingType = bettingType
        self.marketType = marketType
        self.bspMarket = bspMarket
        self.inPlay = inPlay
        self.sgmMarket = sgmMarket
        self.marketStatus = marketStatus
        self.runners = runners
        self.betDelay = betDelay
        self.numberOfRunners = numberOfRunners
        self.numberOfActiveRunners = numberOfActiveRunners
        self.numberOfWinners = numberOfWinners
        self.associatedMarkets = associatedMarkets
        self.productType = productType
        self.marketTypeName = marketTypeName
        self.marketLevels = marketLevels
        self.sortPriority = sortPriority
        self.marketLineRangeInfo = marketLineRangeInfo
        self.raceClass = raceClass
        self.raceType = raceType
        self.raceNumber = raceNumber
        self.competitionID = competitionID
    }

}

extension MarketAttachment {

    private enum CodingKeys: String, CodingKey {
        case marketID = "marketId"
        case key
        case eventTypeID = "eventTypeId"
        case eventID = "eventId"
        case upperLevelEventID = "upperLevelEventId"
        case topLevelEventID = "topLevelEventId"
        case numberOfUpperLevels
        case raceID = "raceId"
        case meetingID = "meetingId"
        case marketName
        case marketTime
        case marketSuspendTime
        case canTurnInPlay
        case bettingType
        case marketType
        case bspMarket
        case inPlay
        case sgmMarket
        case marketStatus
        case runners
        case betDelay
        case numberOfRunners
        case numberOfActiveRunners
        case numberOfWinners
        case associatedMarkets
        case productType
        case marketTypeName
        case marketLevels
        case sortPriority
        case marketLineRangeInfo
        case raceClass
        case raceType
        case raceNumber
        case competitionID = "competitionId"
    }

}
