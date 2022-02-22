import Foundation

public struct BucketFacet: Equatable, Hashable, Codable {

    public let referenceDate: Date
    public let size: Int

    public init(referenceDate: Date, size: Int) {
        self.referenceDate = referenceDate
        self.size = size
    }

}
