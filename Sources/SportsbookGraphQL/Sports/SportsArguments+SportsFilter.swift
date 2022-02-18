import Foundation
import SportsbookCore

extension SportsArguments: SportsFilterConvertible {

    var sportsFilter: SportsFilter {
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
