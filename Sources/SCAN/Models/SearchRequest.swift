import Foundation
import Vapor

public struct SearchRequest: Equatable, Hashable, Content {

    /// Selects how the results that match the selection criteria should be categorized.
    public let facets: [Facet]
    /// Provides the selection criteria, markets that match the given criteria are returned in the search results.
    public let filter: FilterQuery
    public let currencyCode: String?
    public let locale: String
    public let textQuery: String?

    public init(facets: [Facet], filter: FilterQuery = .init(), currencyCode: String? = nil, locale: Locale,
                textQuery: String? = nil) {
        self.currencyCode = currencyCode
        self.facets = facets
        self.filter = filter
        self.locale = locale.identifier.uppercased()
        self.textQuery = textQuery
    }

    public init(facet: Facet, filter: FilterQuery = .init(), currencyCode: String? = nil, locale: Locale,
                textQuery: String? = nil) {
        self.init(facets: [facet], filter: filter, currencyCode: currencyCode, locale: locale, textQuery: textQuery)
    }

}
