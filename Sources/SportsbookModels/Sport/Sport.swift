import Foundation

public struct Sport: Identifiable, Equatable, Codable {

    public let id: Int
    public let name: String
    public let category: Category?

    public init(id: Int, name: String, category: Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

}

extension Sport {

    public enum Category: String, CaseIterable, Codable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
