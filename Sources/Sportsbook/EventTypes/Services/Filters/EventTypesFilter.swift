import Foundation
import NIO

public struct EventTypesFilter {

    public let id: EventTypeDomainModel.ID?
    public let category: EventTypeCategory?

    public init(id: EventTypeDomainModel.ID?, category: EventTypeCategory? = nil) {
        self.id = id
        self.category = category
    }

}

public protocol EventTypesFilterConvertible {

    var eventTypesFilter: EventTypesFilter { get }

}

extension EventTypesFilter: EventTypesFilterConvertible {

    public var eventTypesFilter: EventTypesFilter {
        self
    }

}
