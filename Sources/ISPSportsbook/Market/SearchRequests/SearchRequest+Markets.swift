import Foundation
import SCAN

extension SearchRequest {

    static func markets(withID marketID: String, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .market),
            filter: FilterQuery(
                marketIDs: [marketID]
            ),
            locale: locale
        )
    }

    static func markets(forEvent eventID: Int, locale: Locale) -> SearchRequest {
        markets(forEvents: [eventID], locale: locale)
    }

    static func markets(forEvents eventIDs: [Int], locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .market),
            filter: FilterQuery(
                eventIDs: eventIDs
            ),
            locale: locale
        )
    }

}