import Foundation

public struct AttachmentKey: Equatable, Codable {

    public let eventId: Int?
    public let marketId: String?
    public let sportsbookMarketId: String?
    public let competitionId: Int?
    public let eventTypeId: Int?
    public let meetingId: String?
    public let raceId: String?
    public let externalMarketId: String?

    public init(eventId: Int? = nil, marketId: String? = nil, sportsbookMarketId: String? = nil,
                competitionId: Int? = nil, eventTypeId: Int? = nil, meetingId: String? = nil, raceId: String? = nil,
                externalMarketId: String? = nil) {
        self.eventId = eventId
        self.marketId = marketId
        self.sportsbookMarketId = sportsbookMarketId
        self.competitionId = competitionId
        self.eventTypeId = eventTypeId
        self.meetingId = meetingId
        self.raceId = raceId
        self.externalMarketId = externalMarketId
    }

    public static func == (lhs: AttachmentKey, rhs: AttachmentKey) -> Bool {
        lhs.eventId != nil && lhs.eventId == rhs.eventId
    }

}
