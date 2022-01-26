import Foundation

public struct EventTypeAttachment: Codable {

    public let name: String?
    public let key: String?
    public let eventTypeId: Int?

    public init(name: String? = nil, key: String? = nil, eventTypeId: Int? = nil) {
        self.name = name
        self.key = key
        self.eventTypeId = eventTypeId
    }

}
