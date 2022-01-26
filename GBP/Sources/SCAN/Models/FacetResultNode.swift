import Foundation

public struct FacetResultNode: Codable {

    public let type: FacetType
    public let values: [FacetedValue]
    public let totalResults: Int

    public init(type: FacetType, values: [FacetedValue], totalResults: Int) {
        self.type = type
        self.values = values
        self.totalResults = totalResults
    }

}
