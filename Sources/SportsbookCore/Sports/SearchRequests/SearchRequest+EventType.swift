import Foundation
import SCAN

extension SearchRequest {

    static func eventTypes(withID id: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: FilterQuery(
                eventTypeIDs: [id],
                maxResults: 1
            ),
            locale: locale
        )
    }

    static func eventTypes(locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: FilterQuery(
                productTypes: [.sportsbook],
                maxResults: 0
            ),
            locale: locale
        )
    }

    static func eventTypes(forCompetition competitionID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: FilterQuery(
                competitionIDs: [competitionID],
                maxResults: 0
            ),
            locale: locale
        )
    }

    static func eventTypes(forEvent eventID: Int, locale: Locale) -> SearchRequest {
        SearchRequest(
            facet: Facet(type: .eventType),
            filter: FilterQuery(
                eventIDs: [eventID],
                maxResults: 0
            ),
            locale: locale
        )
    }

}
