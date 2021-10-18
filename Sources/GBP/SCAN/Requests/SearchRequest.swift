import Foundation
import Vapor

public struct SearchRequest: Equatable, Hashable, Content {

    public let facets: [Facet]
    public let filter: SearchFilter
    public let currencyCode: String?
    public let locale: String

    public init(facets: [Facet], filter: SearchFilter = .init(), currencyCode: String? = nil, locale: Locale) {
        self.currencyCode = currencyCode
        self.facets = facets
        self.filter = filter
        self.locale = locale.identifier.uppercased()
    }

    public init(facet: Facet, filter: SearchFilter = .init(), currencyCode: String? = nil, locale: Locale) {
        self.init(facets: [facet], filter: filter, currencyCode: currencyCode, locale: locale)
    }

}
