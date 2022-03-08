import Foundation

public struct CompetitionAttachment: Equatable, Codable {

    public let key: String?
    public let name: String?
    public let competitionID: CompetitionID
    public let eventID: EventID
    public let eventTypeID: EventTypeID
    public let region: CountryCode?

    public init(key: String? = nil, name: String? = nil, competitionID: CompetitionID, eventID: EventID,
                eventTypeID: EventTypeID, region: CountryCode? = nil) {
        self.key = key
        self.name = name
        self.competitionID = competitionID
        self.eventID = eventID
        self.eventTypeID = eventTypeID
        self.region = region
    }

}

extension CompetitionAttachment {

    private enum CodingKeys: String, CodingKey {
        case key
        case name
        case competitionID = "competitionId"
        case eventID = "eventId"
        case eventTypeID = "eventTypeId"
        case region
    }

}
