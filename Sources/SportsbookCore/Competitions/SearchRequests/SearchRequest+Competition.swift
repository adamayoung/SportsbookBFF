import Foundation
import SCAN

extension SearchRequest {

    static func competitions(forEventType eventTypeID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: FilterQuery(
                eventTypeIDs: [eventTypeID]
            ),
            locale: locale
        )
    }

    static func competition(withID competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: FilterQuery(
                competitionIDs: [competitionID]
            ),
            locale: locale
        )
    }

    static func competitions(forEvent eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: FilterQuery(
                eventIDs: [eventID]
            ),
            locale: locale
        )
    }

}
