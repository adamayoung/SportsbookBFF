import Foundation

public struct EventType: Identifiable, Equatable, Codable {

    public let id: Int
    public let name: String
    public let category: Category?

    public init(id: Int, name: String, category: Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

}

public extension EventType {

    enum Category: String, CaseIterable, Codable {
        case avb = "AVB"
        case outright = "OUTRIGHT"
        case racingNew = "RACING_NEW"
        case racingOld = "RACING_OLD"
    }

}
