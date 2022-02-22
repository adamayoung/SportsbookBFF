import Foundation

public struct RangeFacet: Equatable, Hashable, Codable {

    public let fromDate: Date?
    public let toDate: Date?

    public init(fromDate: Date?, toDate: Date?) {
        self.fromDate = fromDate
        self.toDate = toDate
    }

}
