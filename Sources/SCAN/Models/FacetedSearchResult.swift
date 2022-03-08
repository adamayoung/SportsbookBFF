import Foundation

public struct FacetedSearchResult: Equatable, Codable {

    /// List of facets.
    public let facets: [FacetResultNode]
    /// Results.
    public let results: [AttachmentKey]
    /// Attachments.
    public let attachments: Attachments
    /// Actual search term.
    public let actualSearchTerm: String?

    public init(facets: [FacetResultNode], results: [AttachmentKey], attachments: Attachments,
                actualSearchTerm: String? = nil) {
        self.facets = facets
        self.results = results
        self.attachments = attachments
        self.actualSearchTerm = actualSearchTerm
    }

}
