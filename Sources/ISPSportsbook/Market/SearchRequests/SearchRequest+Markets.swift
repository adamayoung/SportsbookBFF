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

    static func markets(forEvent eventID: Int, marketTypes: [String]? = nil, locale: Locale) -> SearchRequest {
        markets(forEvents: [eventID], marketTypes: marketTypes, locale: locale)
    }

    static func markets(forEvents eventIDs: [Int], marketTypes: [String]? = nil, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .market),
            filter: FilterQuery(
                eventIDs: eventIDs,
                marketTypeCodes: marketTypes
            ),
            locale: locale
        )
    }

}
