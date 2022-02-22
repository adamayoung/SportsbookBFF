import Foundation

public struct EventAttachment: Equatable, Codable {

    public let eventID: EventID
    public let key: String?
    public let name: String?
    public let eventTypeID: EventTypeID
    public let competitionID: CompetitionID?
    public let countryCode: String?
    public let timezone: String?
    public let venue: String?
    public let openDate: Date?
    public let videoAvailable: Bool?
    public let marketPrecedence: [MarketID]?
    public let onTVChannels: [String]?

    public init(eventID: EventID, key: String? = nil, name: String? = nil, eventTypeID: EventTypeID,
                competitionID: CompetitionID? = nil, countryCode: String? = nil, timezone: String? = nil,
                venue: String? = nil, openDate: Date? = nil, videoAvailable: Bool? = nil,
                marketPrecedence: [MarketID]? = nil, onTVChannels: [String]? = nil) {
        self.eventID = eventID
        self.key = key
        self.name = name
        self.eventTypeID = eventTypeID
        self.competitionID = competitionID
        self.countryCode = countryCode
        self.timezone = timezone
        self.venue = venue
        self.openDate = openDate
        self.videoAvailable = videoAvailable
        self.marketPrecedence = marketPrecedence
        self.onTVChannels = onTVChannels
    }

}

extension EventAttachment {

    private enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case key
        case name
        case eventTypeID = "eventTypeId"
        case competitionID = "competitionId"
        case countryCode
        case timezone
        case venue
        case openDate
        case videoAvailable
        case marketPrecedence
        case onTVChannels = "onTvChannels"
    }

}
