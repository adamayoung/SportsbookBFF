import Foundation

public struct SportsFilter {

    public let id: SportDomainModel.ID?
    public let category: SportDomainModel.Category?

    public init(id: SportDomainModel.ID?, category: SportDomainModel.Category? = nil) {
        self.id = id
        self.category = category
    }

}

public protocol SportsFilterConvertible {

    var sportsFilter: SportsFilter { get }

}

extension SportsFilter: SportsFilterConvertible {

    public var sportsFilter: SportsFilter {
        self
    }

}
