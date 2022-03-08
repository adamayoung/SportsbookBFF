import Foundation

public struct AttachmentKey: Equatable, Codable {

    public let eventID: EventID?
    public let marketID: MarketID?
    public let sportsbookMarketID: MarketID?
    public let competitionID: CompetitionID?
    public let eventTypeID: EventTypeID?
    public let meetingID: MeetingID?
    public let raceID: RaceID?
    public let externalMarketID: MarketID?

    public init(eventID: EventID? = nil, marketID: MarketID? = nil, sportsbookMarketID: MarketID? = nil,
                competitionID: CompetitionID? = nil, eventTypeID: EventTypeID? = nil, meetingID: MeetingID? = nil,
                raceID: RaceID? = nil, externalMarketID: MarketID? = nil) {
        self.eventID = eventID
        self.marketID = marketID
        self.sportsbookMarketID = sportsbookMarketID
        self.competitionID = competitionID
        self.eventTypeID = eventTypeID
        self.meetingID = meetingID
        self.raceID = raceID
        self.externalMarketID = externalMarketID
    }

    public static func == (lhs: AttachmentKey, rhs: AttachmentKey) -> Bool {
        lhs.eventID != nil && lhs.eventID == rhs.eventID
    }

}

extension AttachmentKey {

    private enum CodingKeys: String, CodingKey {

        case eventID = "eventId"
        case marketID = "marketId"
        case sportsbookMarketID = "sportsbookMarketId"
        case competitionID = "competitionId"
        case eventTypeID = "eventTypeId"
        case meetingID = "meetingId"
        case raceID = "raceId"
        case externalMarketID = "externalMarketId"

    }

}
