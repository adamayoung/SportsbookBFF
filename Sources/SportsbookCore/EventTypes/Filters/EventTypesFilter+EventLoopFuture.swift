import Foundation

extension Array where Element == EventTypeDomainModel {

    public func filter(_ eventTypesFilter: EventTypesFilter?) -> [EventTypeDomainModel] {
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
