import Foundation

public struct SearchResponse: Codable {

    public let facets: [FacetResultNode]
    public let attachments: Attachments
    public let actualSearchTerm: String?

    public init(facets: [FacetResultNode], attachments: Attachments, actualSearchTerm: String? = nil) {
        self.facets = facets
        self.attachments = attachments
        self.actualSearchTerm = actualSearchTerm
    }

}
