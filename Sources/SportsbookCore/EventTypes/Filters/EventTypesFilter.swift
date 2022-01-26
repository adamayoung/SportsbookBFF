import Foundation

public struct EventTypesFilter {

    public let id: EventTypeDomainModel.ID?
    public let category: EventTypeDomainModel.Category?

    public init(id: EventTypeDomainModel.ID?, category: EventTypeDomainModel.Category? = nil) {
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
