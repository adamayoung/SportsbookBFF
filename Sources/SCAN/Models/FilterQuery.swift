import Foundation

public struct FilterQuery: Equatable, Hashable, Codable {

    public let exchangeIDs: [Int]?
    public let eventTypeIDs: [EventTypeID]?
    public let eventIDs: [EventID]?
    public let marketIDs: [MarketID]?
    public let competitionIDs: [CompetitionID]?
    public let productTypes: [ProductType]?
    public let bspOnly: Bool?
    public let turnInPlayEnabled: Bool?
    public let inPlayOnly: Bool?
    public let sgmOnly: Bool?
    public let marketBettingTypes: [MarketBettingType]?
    public let marketCountries: [CountryCode]?
    public let marketTypeCodes: [String]?
    public let venues: [String]?
    public let marketStartingAfter: Date?
    public let marketStartingBefore: Date?
    public let contentGroup: ContentGroup?
    public let selectBy: FacetSelectBy?
    public let startRecord: Int?
    public let maxResults: Int?
    public let attachments: [AttachmentType]?
    public let meetingIDs: [MeetingID]?
    public let raceIDs: [RaceID]?
    public let marketLevels: [MarketLevel]?
    public let upperLevelEventIDs: [EventID]?
    public let videoAvailable: Bool?
    public let onTV: Bool?
    public let tradedVolumeFrom: Int?
    public let raceClasses: [String]?
    public let numberOfWinners: [Int]?
    public let raceTypes: [String]?

    public init(exchangeIDs: [Int]? = nil, eventTypeIDs: [EventTypeID]? = nil, eventIDs: [EventID]? = nil,
                marketIDs: [MarketID]? = nil, competitionIDs: [CompetitionID]? = nil,
                productTypes: [ProductType] = .default, bspOnly: Bool? = nil, turnInPlayEnabled: Bool? = nil,
                inPlayOnly: Bool? = nil, sgmOnly: Bool? = nil, marketBettingTypes: [MarketBettingType]? = nil,
                marketCountries: [CountryCode]? = nil, marketTypeCodes: [String]? = nil, venues: [String]? = nil,
                marketStartingAfter: Date? = nil, marketStartingBefore: Date? = nil, contentGroup: ContentGroup? = nil,
                selectBy: FacetSelectBy? = nil, startRecord: Int? = nil, maxResults: Int? = nil,
                attachments: [AttachmentType]? = nil, meetingIDs: [MeetingID]? = nil, raceIDs: [RaceID]? = nil,
                marketLevels: [MarketLevel]? = nil, upperLevelEventIDs: [EventID]? = nil, videoAvailable: Bool? = nil,
                onTV: Bool? = nil, tradedVolumeFrom: Int? = nil, raceClasses: [String]? = nil,
                numberOfWinners: [Int]? = nil, raceTypes: [String]? = nil) {
        self.exchangeIDs = exchangeIDs
        self.eventTypeIDs = eventTypeIDs
        self.eventIDs = eventIDs
        self.marketIDs = marketIDs
        self.competitionIDs = competitionIDs
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
        self.meetingIDs = meetingIDs
        self.raceIDs = raceIDs
        self.marketLevels = marketLevels
        self.upperLevelEventIDs = upperLevelEventIDs
        self.videoAvailable = videoAvailable
        self.onTV = onTV
        self.tradedVolumeFrom = tradedVolumeFrom
        self.raceClasses = raceClasses
        self.numberOfWinners = numberOfWinners
        self.raceTypes = raceTypes
    }

}

extension FilterQuery {

    private enum CodingKeys: String, CodingKey {
        case exchangeIDs = "exchangeIds"
        case eventTypeIDs = "eventTypeIds"
        case eventIDs = "eventIds"
        case marketIDs = "marketIds"
        case competitionIDs = "competitionIds"
        case productTypes
        case bspOnly
        case turnInPlayEnabled
        case inPlayOnly
        case sgmOnly
        case marketBettingTypes
        case marketCountries
        case marketTypeCodes
        case venues
        case marketStartingAfter
        case marketStartingBefore
        case contentGroup
        case selectBy
        case startRecord
        case maxResults
        case attachments
        case meetingIDs = "meetingIds"
        case raceIDs = "raceIds"
        case marketLevels
        case upperLevelEventIDs
        case videoAvailable
        case onTV = "onTv"
        case tradedVolumeFrom
        case raceClasses
        case numberOfWinners
        case raceTypes
    }

}
