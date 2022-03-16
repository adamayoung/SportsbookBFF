import Foundation

struct SportDTO: Identifiable, Equatable, Codable {

    let id: Int
    let name: String
    let category: Category?

    init(id: Int, name: String, category: Category? = nil) {
        self.id = id
        self.name = name
        self.category = category
    }

}

extension SportDTO {

    enum Category: String, CaseIterable, Codable {
        case avb
        case outright
        case racingNew
        case racingOld
    }

}
