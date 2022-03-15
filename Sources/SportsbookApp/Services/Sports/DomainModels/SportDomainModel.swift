import Foundation

struct SportDomainModel: Identifiable, Equatable, Hashable, Comparable {

    let id: Int
    let name: String
    let category: SportDomainModel.Category?

    init(id: Int, name: String, category: SportDomainModel.Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

    static func < (lhs: SportDomainModel, rhs: SportDomainModel) -> Bool {
        lhs.name.localizedLowercase < rhs.name.localizedLowercase
    }

}

extension SportDomainModel {

    enum Category: CaseIterable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
