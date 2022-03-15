import Foundation

extension Sport {

    init(sport: SportDomainModel) {
        let category = Category(category: sport.category)

        self.init(id: sport.id, name: sport.name, category: category)
    }

}

extension Sport.Category {

    init?(category: SportDomainModel.Category?) {
        guard let category = category else {
            return nil
        }

        switch category {
        case .outright: self = .outright
        case .avb: self = .avb
        case .racingNew: self = .racingNew
        case .racingOld: self = .racingOld
        }
    }

}
