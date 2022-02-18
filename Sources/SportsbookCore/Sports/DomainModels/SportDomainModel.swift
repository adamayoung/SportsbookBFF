import Foundation

public struct SportDomainModel: Identifiable, Equatable, Hashable, Comparable {

    public let id: Int
    public let name: String
    public let category: SportDomainModel.Category?

    public init(id: Int, name: String, category: SportDomainModel.Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    public static func < (lhs: SportDomainModel, rhs: SportDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}

extension SportDomainModel {

    public enum Category: CaseIterable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
