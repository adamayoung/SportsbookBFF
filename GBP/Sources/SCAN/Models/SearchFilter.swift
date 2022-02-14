import Foundation

public struct SearchFilter: Equatable, Hashable, Codable {

    public let exchangeIds: [Int]?
    public let eventTypeIds: [Int]?
    public let eventIds: [Int]?
    public let marketIds: [String]?
    public let competitionIds: [Int]?
    public let productTypes: [SearchFilter.ProductType]?
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
    public let selectBy: SearchFilter.FacetSelectBy?
    public let startRecord: Int?
    public let maxResults: Int?
    public let attachments: [SearchFilter.AttachmentType]?
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
                marketIds: [String]? = nil, competitionIds: [Int]? = nil,
                productTypes: [SearchFilter.ProductType] = .default, bspOnly: Bool? = nil,
                turnInPlayEnabled: Bool? = nil, inPlayOnly: Bool? = nil, sgmOnly: Bool? = nil,
                marketBettingTypes: [MarketBettingType]? = nil, marketCountries: [String]? = nil,
                marketTypeCodes: [String]? = nil, venues: [String]? = nil, marketStartingAfter: Date? = nil,
                marketStartingBefore: Date? = nil, contentGroup: ContentGroup = .default,
                selectBy: SearchFilter.FacetSelectBy? = nil, startRecord: Int? = nil, maxResults: Int? = nil,
                attachments: [SearchFilter.AttachmentType]? = nil, meetingIds: [String]? = nil,
                raceIds: [String]? = nil, marketLevels: [MarketLevel]? = nil, upperLevelEventIds: [Int]? = nil,
                videoAvailable: Bool? = nil, onTv: Bool? = nil, tradedVolumeFrom: Int? = nil,
                raceClasses: [String]? = nil, numberOfWinners: [Int]? = nil, raceTypes: [String]? = nil,
                marketType: [String]? = nil) {
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

extension SearchFilter {

    public enum AttachmentType: String, CaseIterable, Equatable, Hashable, Codable {
        case eventType = "EVENT_TYPE"
        case competition = "COMPETITION"
        case event = "EVENT"
        case market = "MARKET"
        case sportsbookMarket = "SPORTSBOOK_MARKET"
        case meeting = "MEETING"
        case race = "RACE"
        case marketLite = "MARKET_LITE"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    public enum FacetSelectBy: String, CaseIterable, Equatable, Hashable, Codable {
        case minimumTraded = "MINIMUM_TRADED"
        case maximumTraded = "MAXIMUM_TRADED"
        case minimumAvailable = "MINIMUM_AVAILABLE"
        case maximumAvailable = "MAXIMUM_AVAILABLE"
        case firstToStart = "FIRST_TO_START"
        case lastToStart = "LAST_TO_START"
        case rank = "RANK"
        case rankFastLink = "RANK_FAST_LINK"
        case rankSlowLink = "RANK_SLOW_LINK"
        case firstToStartAZ = "FIRST_TO_START_AZ"
        case unknown = "UNKNOWN"

        public init(from decoder: Decoder) throws {
            self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
        }
    }

    public enum ProductType: String, Equatable, Hashable, Codable {
        case sportsbook = "SPORTSBOOK"
        case exchange = "EXCHANGE"
        case tote = "TOTE"

        public static let `default`: ProductType = .sportsbook
    }

}

extension Collection where Element == SearchFilter.ProductType {

    public static var `default`: [SearchFilter.ProductType] {
        [.default]
    }

}
