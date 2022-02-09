import Foundation
import SportsbookCore
import Vapor

public struct EventTypesQuery: Content {

    let id: EventType.ID?
    let category: EventType.Category?

    init(id: EventType.ID? = nil, category: EventType.Category? = nil) {
        self.id = id
        self.category = category
    }

}

extension EventTypesQuery: EventTypesFilterConvertible {

    public var eventTypesFilter: EventTypesFilter {
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
