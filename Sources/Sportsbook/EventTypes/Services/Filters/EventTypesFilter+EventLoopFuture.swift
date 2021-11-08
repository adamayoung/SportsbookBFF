import Foundation
import NIO

public extension EventLoopFuture {

    @inlinable
    func filter(with itemFilter: EventTypesFilter?) -> EventLoopFuture<Value> where Value == [EventTypeDomainModel] {
        map { $0.filter(itemFilter) }
    }

}

public extension Array where Element == EventTypeDomainModel {

    func filter(_ eventTypesFilter: EventTypesFilter?) -> [EventTypeDomainModel] {
        guard let eventTypesFilter = eventTypesFilter else {
            return self
        }

        var filtered = self
        if let category = eventTypesFilter.category {
            filtered = filtered.filter { $0.category == category }
        }

        return filtered
    }

}
