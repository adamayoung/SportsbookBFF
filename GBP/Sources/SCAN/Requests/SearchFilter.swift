import Foundation

public struct SearchFilter: Equatable, Hashable, Codable {

    public let exchangeIds: [Int]?
    public let eventTypeIds: [Int]?
    public let eventIds: [Int]?
    public let marketIds: [String]?
    public let competitionIds: [Int]?
    public let productTypes: [ProductType]?
    public let bspOnly: Bool?
    public let turnInPlayEnabled: Bool?
    public let inPlayOnly: Bool?
    public let sgmOnly: Bool?
    public let marketBettingTypes: [MarketBettingType]?
    public let marketCountries: [String]?
    public let marketTypeCodes: [String]?
    public let venues: [String]?
    public let marketStartingAfter: Date?
    public let marketStartingBefore: Date?
    public let contentGroup: ContentGroup
    public let selectBy: FacetSelectBy?
    public let startRecord: Int?
    public let maxResults: Int?
    public let attachments: [AttachmentType]?
    public let meetingIds: [String]?
    public let raceIds: [String]?
    public let marketLevels: [MarketLevel]?
    public let upperLevelEventIds: [Int]?
    public let videoAvailable: Bool?
    public let onTv: Bool?
    public let tradedVolumeFrom: Int?
    public let raceClasses: [String]?
    public let numberOfWinners: [Int]?
    public let raceTypes: [String]?
    public let marketType: [String]?

    public init(exchangeIds: [Int]? = nil, eventTypeIds: [Int]? = nil, eventIds: [Int]? = nil,
                marketIds: [String]? = nil, competitionIds: [Int]? = nil, productTypes: [ProductType] = .default,
                bspOnly: Bool? = nil, turnInPlayEnabled: Bool? = nil, inPlayOnly: Bool? = nil, sgmOnly: Bool? = nil,
                marketBettingTypes: [MarketBettingType]? = nil, marketCountries: [String]? = nil,
                marketTypeCodes: [String]? = nil, venues: [String]? = nil, marketStartingAfter: Date? = nil,
                marketStartingBefore: Date? = nil, contentGroup: ContentGroup = .default,
                selectBy: FacetSelectBy? = nil, startRecord: Int? = nil, maxResults: Int? = nil,
                attachments: [AttachmentType]? = nil, meetingIds: [String]? = nil, raceIds: [String]? = nil,
                marketLevels: [MarketLevel]? = nil, upperLevelEventIds: [Int]? = nil, videoAvailable: Bool? = nil,
                onTv: Bool? = nil, tradedVolumeFrom: Int? = nil, raceClasses: [String]? = nil,
                numberOfWinners: [Int]? = nil, raceTypes: [String]? = nil, marketType: [String]? = nil) {
        self.exchangeIds = exchangeIds
        self.eventTypeIds = eventTypeIds
        self.eventIds = eventIds
        self.marketIds = marketIds
        self.competitionIds = competitionIds
        self.productTypes = productTypes
        self.bspOnly = bspOnly
        self.turnInPlayEnabled = turnInPlayEnabled
        self.inPlayOnly = inPlayOnly
        self.sgmOnly = sgmOnly
        self.marketBettingTypes = marketBettingTypes
        self.marketCountries = marketCountries
        self.marketTypeCodes = marketTypeCodes
        self.venues = venues
        self.marketStartingAfter = marketStartingAfter
        self.marketStartingBefore = marketStartingBefore
        self.contentGroup = contentGroup
        self.selectBy = selectBy
        self.startRecord = startRecord
        self.maxResults = maxResults
        self.attachments = attachments
        self.meetingIds = meetingIds
        self.raceIds = raceIds
        self.marketLevels = marketLevels
        self.upperLevelEventIds = upperLevelEventIds
        self.videoAvailable = videoAvailable
        self.onTv = onTv
        self.tradedVolumeFrom = tradedVolumeFrom
        self.raceClasses = raceClasses
        self.numberOfWinners = numberOfWinners
        self.raceTypes = raceTypes
        self.marketType = marketType
    }

}
