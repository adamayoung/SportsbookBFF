import Foundation

public struct EventTypeAttachment: Equatable, Codable {

    public let name: String?
    public let key: String?
    public let eventTypeID: EventTypeID

    public init(name: String? = nil, key: String? = nil, eventTypeID: EventTypeID) {
        self.name = name
        self.key = key
        self.eventTypeID = eventTypeID
    }

}

extension EventTypeAttachment {

    private enum CodingKeys: String, CodingKey {
        case name
        case key
        case eventTypeID = "eventTypeId"
    }

}
