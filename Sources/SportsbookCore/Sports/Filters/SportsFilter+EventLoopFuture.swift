import Foundation

extension Array where Element == SportDomainModel {

    public func filter(_ sportsFilter: SportsFilter?) -> [SportDomainModel] {
        guard let sportsFilter = sportsFilter else {
            return self
        }

        var filtered = self
        if let category = sportsFilter.category {
            filtered = filtered.filter { $0.category == category }
        }

        return filtered
    }

}
