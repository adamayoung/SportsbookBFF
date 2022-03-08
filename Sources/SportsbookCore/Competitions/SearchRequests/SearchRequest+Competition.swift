import Foundation
import SCAN

extension SearchRequest {

    static func competitions(forEventType eventTypeID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(
                type: .eventType,
                next: Facet(type: .competition)
            ),
            filter: FilterQuery(
                eventTypeIDs: [eventTypeID],
                selectBy: .firstToStart,
                maxResults: 0
            ),
            locale: locale
        )
    }

    static func competition(withID competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .competition),
            filter: FilterQuery(
                competitionIDs: [competitionID],
                maxResults: 1
            ),
            locale: locale
        )
    }

    static func competitions(forEvent eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(
                type: .event,
                next: Facet(type: .competition)
            ),
            filter: FilterQuery(
                eventIDs: [eventID],
                selectBy: .firstToStart,
                maxResults: 1
            ),
            locale: locale
        )
    }

}
