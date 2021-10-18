import Foundation
import GBP

extension SearchRequest {

    static func market(withID marketID: String, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .market),
            filter: SearchFilter(
                marketIds: [marketID]
            ),
            locale: locale
        )
    }

    static func markets(forEvent eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .market),
            filter: SearchFilter(
                eventIds: [eventID]
            ),
            locale: locale
        )
    }

}
