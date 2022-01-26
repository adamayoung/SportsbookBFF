import Foundation

public struct EventTypeDomainModel: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let category: EventTypeDomainModel.Category?

    public init(id: Int, name: String, category: EventTypeDomainModel.Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    public static func < (lhs: EventTypeDomainModel, rhs: EventTypeDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}

extension EventTypeDomainModel {

    public enum Category: CaseIterable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
