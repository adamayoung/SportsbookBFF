import Foundation
import SportsbookCore

extension EventTypesArguments: EventTypesFilterConvertible {

    var eventTypesFilter: EventTypesFilter {
        let category: EventTypeDomainModel.Category? = {
            switch self.category {
            case .avb: return .avb
            case .outright: return .outright
            case .racingNew: return .racingNew
            case .racingOld: return .racingOld
            case .none: return nil
            }
        }()

        return EventTypesFilter(id: self.id, category: category)
    }

}
