import Foundation

public struct FacetResultNode: Equatable, Codable {

    public let type: FacetName
    public let values: [FacetedValues]
    public let totalResults: Int

    public init(type: FacetName, values: [FacetedValues], totalResults: Int) {
        self.type = type
        self.values = values
        self.totalResults = totalResults
    }

}
