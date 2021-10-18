import Foundation

public struct Competition: Identifiable, Equatable, Hashable, Codable {

    public let id: Int
    public let name: String
    public let eventTypeID: Int

    public init(id: Int, name: String, eventTypeID: Int) {
        self.id = id
        self.name = name
        self.eventTypeID = eventTypeID
    }

}
