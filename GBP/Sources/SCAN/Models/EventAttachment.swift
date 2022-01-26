import Foundation

public struct EventAttachment: Codable {

    public let eventId: Int
    public let name: String?
    public let key: String?
    public let eventTypeId: Int
    public let competitionId: Int?
    public let countryCode: String?
    public let timezone: String?
    public let openDate: Date?
    public let videoAvailable: Bool?

    public init(eventId: Int, name: String? = nil, key: String? = nil, eventTypeId: Int, competitionId: Int? = nil,
                countryCode: String? = nil, timezone: String? = nil, openDate: Date? = nil,
                videoAvailable: Bool? = nil) {
        self.eventId = eventId
        self.name = name
        self.key = key
        self.eventTypeId = eventTypeId
        self.competitionId = competitionId
        self.countryCode = countryCode
        self.timezone = timezone
        self.openDate = openDate
        self.videoAvailable = videoAvailable
    }

}
