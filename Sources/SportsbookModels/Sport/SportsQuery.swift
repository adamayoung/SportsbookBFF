import Foundation
import SportsbookCore
import Vapor

public struct SportsQuery: Content {

    let id: Sport.ID?
    let category: Sport.Category?

    init(id: Sport.ID? = nil, category: Sport.Category? = nil) {
        self.id = id
        self.category = category
    }

}

extension SportsQuery: SportsFilterConvertible {

    public var sportsFilter: SportsFilter {
        let category: SportDomainModel.Category? = {
            switch self.category {
            case .avb: return .avb
            case .outright: return .outright
            case .racingNew: return .racingNew
            case .racingOld: return .racingOld
            case .none: return nil
            }
        }()

        return SportsFilter(id: self.id, category: category)
    }

}
